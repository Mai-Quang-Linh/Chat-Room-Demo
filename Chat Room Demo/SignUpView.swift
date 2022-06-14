//
//  SignUpView.swift
//  Chat Room Demo
//
//  Created by USER on 2022/01/03.
//

import SwiftUI

struct SignUpView: View {
    @EnvironmentObject var session: SessionManager
    
    @State var username = ""
    @State var password = ""

    let errors:String
    
    var body: some View {
        VStack{
            Spacer()
            
            Text(errors)
            TextField("Username", text: $username)
            SecureField("Password", text: $password)
            Button("Sign up", action:{
                session.signUp(username: username, password: password)
            })
            
            Spacer()
            
            Button("Already have an account? Login.", action: {
                session.showLogin()
            })
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView(errors:"")
    }
}
