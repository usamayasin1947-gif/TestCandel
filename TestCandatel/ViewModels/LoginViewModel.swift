//
//  LoginViewModel.swift
//  TestCandatel
//
//  Created by osamaYasin on 12/2/24.
//

import Foundation


class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var isLogin : Bool = false
    // Keychain Manager instance
    let keychainManager = KeychainManager()
    var isFormValid: Bool {
        if email.isEmpty && password.isEmpty {
            SnackbarManager.shared.show(message: "Email and password can't be empty")
            return false
        } else if email.isEmpty {
            SnackbarManager.shared.show(message: "Email can't be empty")
            return false
        } else if password.isEmpty {
            SnackbarManager.shared.show(message: "Password can't be empty")
            return false
        }
        

        if !email.isEmpty && !email.isValidEmail {
            SnackbarManager.shared.show(message: "Email is not valid")
            return false
        }
        
       
        if !password.isEmpty && !password.isValidPassword {
            SnackbarManager.shared.show(message: "Password must have at least 8 characters, one capital letter, one special character, and one number")
            return false
        }
     
        return true
    }

    func login() {
        if isFormValid {
            saveCredentials(email: email, password: password)
            SnackbarManager.shared.show(message: "Login successful!")
        }
    }


    func saveCredentials(email: String, password: String) {
        let emailData = email.data(using: .utf8)!
        let passwordData = password.data(using: .utf8)!
        
        let emailStatus = KeychainManager.shared.save(key: "userEmail", data: emailData)
        let passwordStatus = KeychainManager.shared.save(key: "userPassword", data: passwordData)
        
        if emailStatus == errSecSuccess && passwordStatus == errSecSuccess {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){[weak self] in
                self?.isLogin = true
            }
           
        } else {
            SnackbarManager.shared.show(message: "Error saving credentials")
            print("Error saving credentials")
        }
    }


    func retrieveCredentials() -> (email: String?, password: String?) {
        if let emailData = KeychainManager.shared.retrieve(key: "userEmail"),
           let passwordData = KeychainManager.shared.retrieve(key: "userPassword") {
            let email = String(data: emailData, encoding: .utf8)
            let password = String(data: passwordData, encoding: .utf8)
            return (email, password)
        }
        return (nil, nil)
    }

}



