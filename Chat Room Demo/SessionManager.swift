//
//  SessionManager.swift
//  Chat Room Demo
//
//  Created by USER on 2022/01/03.
//

import Amplify
import SwiftUI
import AWSMobileClient

enum AuthState {
    case signup
    case login
    case session(user: AuthUser)
}


final class SessionManager: ObservableObject {
    @Published var authState: AuthState = .login
    @Published var authError: String = ""
    func getCurrentAuthUser (){
        if let user = Amplify.Auth.getCurrentUser() {
            authState = .session(user: user)
            print(user)
        } else {
            authState = .login
        }
        print(authState)
    }
    func showSignUp() {
        authState = .signup
    }
    func showLogin() {
        authState = .login
    }
    func signUp(username: String, password: String){
        
        _ = Amplify.Auth.signUp(username: username, password: password)
        { [weak self] result in
            switch result {
            case .success(let signUpResult):
                print("Sign up result:", signUpResult)
                DispatchQueue.main.async {
                    self?.authError = ""
                    self?.authState = .login
                }
            case .failure(let error):
                print("sign up error:", error)
                DispatchQueue.main.async {
                    self?.authError = error.errorDescription
                }
            }
        }
    }
    
    func login(username: String, password: String){
        print("logging in...")
        _ = Amplify.Auth.signIn(username: username, password: password)
        { [weak self] result in
            switch result{
            case .success(let signinResult):
                print(signinResult)
                if signinResult.isSignedIn{
                    DispatchQueue.main.async {
                        self?.authError = ""
                        self?.getCurrentAuthUser()
                    }
                }
            case .failure(let error):
                print(error)
                DispatchQueue.main.async {
                    self?.authError = error.errorDescription
                }
            }
        }
    }
    
    func logout(){
        print("logging out...")
        _ = Amplify.Auth.signOut()
        { [weak self] result in
            switch result{
            case .success():
                DispatchQueue.main.async {
                    self?.authError = ""
                    self?.getCurrentAuthUser()
                }
            case .failure(let error):
                print(error)
                DispatchQueue.main.async {
                    self?.authError = error.errorDescription
                }
            }
        }
    }
}
