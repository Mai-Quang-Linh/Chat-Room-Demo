//
//  GraphQLManager.swift
//  Chat Room Demo
//
//  Created by USER on 2022/01/04.
//

import Amplify
import AWSPluginsCore
import AWSAppSync
import AWSMobileClient
import Combine

final class DemoChatAppMsg {
    var from: String? = nil
    var msg: String? = nil
    var msgId: Int = 0
    var upDate: String? = nil
    init(from: String?, msg: String?, msgId: Int, upDate: String?){
        self.from=from
        self.msg=msg
        self.msgId=msgId
        if (upDate == nil){
            self.upDate="Dawn of time"
        }else{
            self.upDate=upDate
        }
    }
}

final class GraphQLManager: ObservableObject{
    
    var appSyncClient: AWSAppSyncClient?
    var roomWatcher: AWSAppSyncSubscriptionWatcher<AsignUserSubSubscription>? = nil
    var msgWatcher: AWSAppSyncSubscriptionWatcher<PostMsgSubSubscription>? = nil
    var msgNum: Int? = nil
    var newMsg: Bool = false
    var pageToken: String? = ""
    @Published var room: String? = nil
    @Published var availableRoom: [String?]? = nil
    @Published var msgs: [DemoChatAppMsg]? = nil
    
    func appSyncInit(){
        do {
            // You can choose the directory in which AppSync stores its persistent cache databases
            let cacheConfiguration = try AWSAppSyncCacheConfiguration()

            // AppSync configuration & client initialization
            let appSyncServiceConfig = try AWSAppSyncServiceConfig()
            let appSyncConfig = try AWSAppSyncClientConfiguration(
                appSyncServiceConfig: appSyncServiceConfig,
                userPoolsAuthProvider: {
                    class MyCognitoUserPoolsAuthProvider : AWSCognitoUserPoolsAuthProviderAsync {
                        func getLatestAuthToken(_ callback: @escaping (String?, Error?) -> Void) {
                            Amplify.Auth.fetchAuthSession { result in
                                do {
                                    let session = try result.get()
                                    // Get cognito user pool token
                                    if let cognitoTokenProvider = session as? AuthCognitoTokensProvider {
                                        let tokens = try cognitoTokenProvider.getCognitoTokens().get()
                                        callback(tokens.idToken, nil)
                                    }
                                } catch {
                                    print("Fetch auth session failed with error - \(error)")
                                    callback(nil, error)
                                }
                            }
                        }
                    }
                    return MyCognitoUserPoolsAuthProvider()
                }(),
                cacheConfiguration: cacheConfiguration)
            appSyncClient = try AWSAppSyncClient(appSyncConfig: appSyncConfig)
            // Set id as the cache key for objects. See architecture section for details
            appSyncClient?.apolloClient?.cacheKeyForObject = { $0["msgId"] }
        } catch {
            print("Error initializing appsync client. \(error)")
        }
    }
    
    func getFirstPage(user:AuthUser){
        appSyncClient?.fetch(query: GetPageQuery(room: self.room!,token: ""))  {[weak self] (result, error) in
            if error != nil {
                print(error?.localizedDescription ?? "")
                return
            }else{
                var res:[DemoChatAppMsg] = []
                result?.data?.getPage.items!.reversed().forEach {
                    if (($0?.from) != nil) {
                        res.append(DemoChatAppMsg(from:$0?.from, msg: $0?.msg, msgId: $0!.msgId,upDate: $0?.upDate))
                    }
                }
                DispatchQueue.main.async {
                    self?.msgs = res
                    self?.pageToken = result?.data?.getPage.nextToken
                    self?.getMsgNum()
                    self?.listenToNewMsg(user:user)
                }
            }
        }
    }
    
    func getNextPage(){
        appSyncClient?.fetch(query: GetPageQuery(room: self.room!,token: pageToken!))  {[weak self] (result, error) in
            if error != nil {
                print(error?.localizedDescription ?? "")
                return
            }else{
                var res:[DemoChatAppMsg] = []
                result?.data?.getPage.items!.reversed().forEach {
                    if (($0?.from) != nil) {
                        res.append(DemoChatAppMsg(from:$0?.from, msg: $0?.msg, msgId: $0!.msgId,upDate: $0?.upDate))
                    }
                }
                res.append(contentsOf: (self?.msgs)!)
                DispatchQueue.main.async {
                    self?.msgs = res
                    self?.pageToken = result?.data?.getPage.nextToken
                }
            }
        }
    }
    
    func getMsgNum(){
        appSyncClient?.fetch(query: GetMsgQuery(msgId: 1, room: (self.room)!))  {[weak self] (result, error) in
            if error != nil {
                print(error?.localizedDescription ?? "")
                return
            }else{
                DispatchQueue.main.async {
                    self?.msgNum = result?.data?.getMsg.count
                }
            }
        }
    }
    
    func getRooms(user: AuthUser){
        //Run a query
        appSyncClient?.fetch(query: GetRoomsQuery())  {[weak self] (result, error) in
            if error != nil {
                print(error?.localizedDescription ?? "")
                return
            }else{
                var res:[String?] = []
                result?.data?.getRooms?.items!.forEach {
                    if (($0?.room) != nil) {
                        res.append($0?.room)
                        print(($0?.user)! + " " + ($0?.room)! + " " +  res.description)
                    }
                }
                DispatchQueue.main.async {
                    self?.availableRoom = res
                    self?.listenToNewRoom(user: user)
                }
            }
        }
    }
    
    func createRoom(roomName:String){
        appSyncClient?.perform(mutation: CreateRoomMutation(room: roomName), resultHandler:  {[weak self] (result, error) in
            if let error = error as? AWSAppSyncClientError {
                print("Error occurred: \(error.localizedDescription )")
            }
            if let resultError = result?.errors {
                print("Error saving the item on server: \(resultError)")
                return
            }else{
                DispatchQueue.main.async {
                    if (!((self?.availableRoom?.contains(roomName))!)){
                        self?.availableRoom?.append(roomName)
                    }
                }
            }
        })
    }
    func sendMsg(msg:String){
        appSyncClient?.fetch(query: GetMsgQuery(msgId: 1, room: (self.room)!))  {[weak self] (result, error) in
            if error != nil {
                print(error?.localizedDescription ?? "")
                return
            }else{
                if (result?.data?.getMsg.count == self?.msgNum){
                    self?.postMsg(room: (self?.room)!, msg: msg)
                }
            }
        }
    }
    func postMsg(room:String,msg:String){
        appSyncClient?.perform(mutation: PostMsgMutation(msgId: msgNum!+1,room: room,msg:msg), resultHandler:  {
            (result, error) in
            if let error = error as? AWSAppSyncClientError {
                print("Error occurred: \(error.localizedDescription )")
            }
            if let resultError = result?.errors {
                print("Error saving the item on server: \(resultError)")
                return
            }else{
            }
        })
        DispatchQueue.main.async {
            self.msgNum = self.msgNum! + 1
        }
    }
    
    func listenToNewRoom(user:AuthUser){
        do {
            print(user.username)
            self.roomWatcher = try appSyncClient?.subscribe(subscription: AsignUserSubSubscription(user: user.username)) {
                [weak self] result, transaction, error in
                do {
                    print("result \(String(describing: result))")
                    if let asignUserSub = result?.data?.asignUserSub  {
                        print(asignUserSub.user + " " + asignUserSub.room)
                        DispatchQueue.main.async {
                            self?.availableRoom?.append(asignUserSub.room)
                        }

                    } else if let error = error {
                        print(error.localizedDescription)
                    }
                }
            }
        } catch {
            print("Error starting subscription: \(error.localizedDescription)")
        }
    }
    
    func listenToNewMsg(user:AuthUser){
        do {
            self.msgWatcher = try appSyncClient?.subscribe(subscription: PostMsgSubSubscription(room: (self.room)!)) {
                [weak self] result, transaction, error in
                do {
                    print("result \(String(describing: result))")
                    if let postMsgSub = result?.data?.postMsgSub  {
                        DispatchQueue.main.async {
                            self?.newMsg = true
                            self?.msgs?.append(DemoChatAppMsg(from: postMsgSub.from, msg: postMsgSub.msg, msgId: postMsgSub.msgId,upDate: postMsgSub.upDate))
                            if (postMsgSub.from != user.username){
                                self?.msgNum!+=1
                            }
                        }

                    } else if let error = error {
                        print(error.localizedDescription)
                    }
                }
            }
        } catch {
            print("Error starting subscription: \(error.localizedDescription)")
        }
    }
    
    func leaveRoom(){
        DispatchQueue.main.async {
            self.room = nil
            self.msgs = nil
            self.msgNum = nil
            self.msgWatcher?.cancel()
            do {
                try self.appSyncClient?.clearCaches()
            }catch{
                print("\(error)")
            }
        }
    }
    
    func enterRoom(room:String){
        DispatchQueue.main.async {
            self.room = room
        }
    }
    
    func logout(){
        DispatchQueue.main.async {
            self.leaveRoom()
            self.availableRoom = nil
            self.roomWatcher?.cancel()
            do {
                try self.appSyncClient?.clearCaches()
            }catch{
                print("\(error)")
            }
        }
    }
}
