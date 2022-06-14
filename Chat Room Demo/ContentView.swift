//
//  ContentView.swift
//  Chat Room Demo
//
//  Created by Mai Quang Linh on 2021/11/07.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var session : SessionManager
    @EnvironmentObject var graphQL : GraphQLManager
    
    
    var body: some View {
        switch session.authState{
            case .login:
            LoginView(errors: session.authError)
                .environmentObject(session)
                .environmentObject(graphQL)
            case .signup:
                SignUpView(errors: session.authError)
                .environmentObject(session)
                .environmentObject(graphQL)
            case .session(let user):
                ChatRoomView(user: user)
                .environmentObject(session)
                .environmentObject(graphQL)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
