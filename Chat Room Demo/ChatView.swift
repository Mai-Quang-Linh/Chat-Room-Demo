//
//  ChatView.swift
//  Chat Room Demo
//
//  Created by USER on 2022/01/04.
//

import SwiftUI
import Amplify
import AmplifyPlugins

struct ChatView: View {
    
    let user:AuthUser
    @EnvironmentObject var session : SessionManager
    @EnvironmentObject var graphQL : GraphQLManager
    @State var friendName: String = ""
    @State var msg: String = ""
    @State var newlyLoaded:Bool = true
    @Namespace var ScrollBottom
    
    
    func msgBox(inputMsg:DemoChatAppMsg,username:String) -> some View{
        HStack {
            if (username == inputMsg.from!){
                Spacer()
                VStack{
                    HStack{
                        Text(inputMsg.upDate!)
                            .font(.system(size:8))
                        Spacer()
                        Text(inputMsg.from!)
                            .font(.system(size:10))
                    }
                    .padding(3)
                    HStack{
                        Spacer()
                        Text(inputMsg.msg!)
                            .multilineTextAlignment(.trailing)
                            .font(.system(size: 12))
                    }
                    .padding(3)
                }
                .frame(maxWidth: (UIScreen.main.bounds.width/5)*4)
                .background(Color.blue)
                .border(.black, width: 1)
            }else{
                VStack{
                    HStack{
                        Text(inputMsg.from!)
                            .font(.system(size:12))
                        Spacer()
                        Text(inputMsg.upDate!)
                            .font(.system(size:8))
                    }
                    .padding(3)
                    HStack{
                        Text(inputMsg.msg!)
                            .multilineTextAlignment(.leading)
                            .font(.system(size: 12))
                        Spacer()
                    }
                    .padding(3)
                }
                .frame(maxWidth: (UIScreen.main.bounds.width/5)*4)
                .background(Color.white)
                .border(.black, width: 1)
                Spacer()
            }
        }
        .padding(5)
    }
    
    var body: some View {
        VStack(){
            if (graphQL.room == nil){
                Spacer()
                Text("Exiting room...")
                Spacer()
            }else{
                HStack{
                    Text((graphQL.room)!+": "+user.username)
                    Spacer()        
                    Button("Leave room",action: {
                        graphQL.leaveRoom()
                    })
                }
                HStack{
                    TextField("Friend name",text: $friendName)
                    Spacer()

                    Button("Add friend",action: {
                        
                    })
                }
                ScrollViewReader() {reader in
                    ScrollView(.vertical){
                        LazyVStack(){
                            if (graphQL.msgs == nil){
                                Spacer()
                                Text("Loading...")
                                    .rotationEffect(Angle(degrees: 180)).scaleEffect(x: -1.0, y: 1.0, anchor: .center)
                                Spacer()
                            }else{
                                
                                ForEach(0...(graphQL.msgs!.count-2),id: \.self){
                                    i in
                                    msgBox(inputMsg: graphQL.msgs![graphQL.msgs!.count-1-i], username:user.username)
                                        .rotationEffect(Angle(degrees: 180)).scaleEffect(x: -1.0, y: 1.0, anchor: .center)
                                        .onAppear(perform: {
                                            if (graphQL.newMsg){
                                                print("got new message")
                                                withAnimation(){
                                                    reader.scrollTo(0, anchor: .top)
                                                }
                                                graphQL.newMsg = false
                                            }
                                        })
                                }
                                
                                if (graphQL.msgNum != graphQL.msgs?.count){
                                    msgBox(inputMsg: graphQL.msgs![0], username:user.username)
                                        .rotationEffect(Angle(degrees: 180)).scaleEffect(x: -1.0, y: 1.0, anchor: .center)
                                        .onAppear(perform: {
                                            print("get more plz!!!")
                                            graphQL.getNextPage()
                                        })
                                    Text("Loading...")
                                        .onAppear(){
                                        }
                                        .rotationEffect(Angle(degrees: 180)).scaleEffect(x: -1.0, y: 1.0, anchor: .center)
                                        
                                }
                                else{
                                    
                                }
                            }
                        }
                        .id(ScrollBottom)
                    }
                    .rotationEffect(Angle(degrees: 180)).scaleEffect(x: -1.0, y: 1.0, anchor: .center)
                }
                HStack{
                    TextField("Say something...", text: $msg)
                    Button("Send",action: {
                        graphQL.sendMsg(msg: msg)
                        msg = ""
                    }).foregroundColor(Color.white)
                        .background(Color.blue)
                }
            }
        }
        .padding(5)
        .onAppear{
            if (graphQL.msgs ==  nil){
                graphQL.getFirstPage(user: user)
            }
        }
    }
}
struct ChatView_Previews: PreviewProvider {
    private struct user: AuthUser{
        let userId:String = ""
        let username:String = ""
    }
    static var previews: some View {
        ChatView(user: user())
    }
}
