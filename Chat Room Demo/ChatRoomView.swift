//
//  ChatRoomView.swift
//  Chat Room Demo
//
//  Created by USER on 2022/01/03.
//

import SwiftUI
import Amplify

struct ChatRoomView: View {
    let user:AuthUser
    @EnvironmentObject var session : SessionManager
    @EnvironmentObject var graphQL : GraphQLManager
    var body: some View {
        if ( graphQL.room == nil){
            RoomSelectView(user:user)
                .environmentObject(session)
                .environmentObject(graphQL)
        }else {
            ChatView(user:user)
                .environmentObject(session)
                .environmentObject(graphQL)
        }
    }
}

struct ChatRoomView_Previews: PreviewProvider {
    private struct user: AuthUser{
        let userId:String = ""
        let username:String = ""
    }
    
    static var previews: some View {
        ChatRoomView(user: user())
    }
}
