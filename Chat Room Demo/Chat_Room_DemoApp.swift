//
//  Chat_Room_DemoApp.swift
//  Chat Room Demo
//
//  Created by Mai Quang Linh on 2021/11/07.
//

import Amplify
import AmplifyPlugins
import SwiftUI

@main
struct Chat_Room_DemoApp: App {
    
    @Environment(\.scenePhase) var scenePhase
    @ObservedObject var session = SessionManager()
    @ObservedObject var graphQL = GraphQLManager()
    
    init (){
        AmplifyConfig()
        graphQL.appSyncInit()
        session.getCurrentAuthUser()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(session)
                .environmentObject(graphQL)
        }.onChange(of: scenePhase){
            phase in
                switch phase {
                case .background:
                    print("AppState: background")
                case .active:
                    print("AppState: active")
                case .inactive:
                    print("AppState: inactive")
                @unknown default:
                    print("AppState: unknown")
                }
            
        }
    }
    func AmplifyConfig(){
        do {
            print("configuring")
            try Amplify.add(plugin: AWSCognitoAuthPlugin())
            try Amplify.configure()
            print("Amplify configured with API plugin")
        } catch {
            print("Failed to initialize Amplify with \(error)")
        }
    }
}
