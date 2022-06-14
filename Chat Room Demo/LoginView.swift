//
//  LoginView.swift
//  Chat Room Demo
//
//  Created by USER on 2021/12/30.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var session: SessionManager
    @EnvironmentObject var graphQL: GraphQLManager
    
    @State var username = ""
    @State var password = ""

    let errors:String
    
    var body: some View {
        VStack{
            Spacer()
            
            Text(errors)
            TextField("Username", text: $username)
            SecureField("Password", text: $password)
            Button("Login", action:{
                session.login(username: username, password: password)
            })
            
            Spacer()
            
            Button("Don't have an account? Sign up.", action: {
                session.showSignUp()
            })
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(errors:"")
    }
}
