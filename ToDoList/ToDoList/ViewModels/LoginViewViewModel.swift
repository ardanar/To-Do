//
//  LoginViewViewModel.swift
//  ToDoList
//
//  Created by Arda Nar on 20.01.2024.
//

import Foundation
import Firebase

class LoginViewViewModel: ObservableObject{
    @Published var email = ""
    @Published var password = ""
    @Published var errorMassage = ""
    
    init() {
        
    }
    
    func login(){
        guard validate() else{
            return
        }
        // Try log in
        Auth.auth().signIn(withEmail: email, password: password)
    
    }
    
    private func validate() -> Bool{
        
        errorMassage = ""
        
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
                !password.trimmingCharacters(in: .whitespaces).isEmpty else{
            
            errorMassage = "Please fill in all fields"
            
            return false
        }
        
        guard email.contains("@") && email.contains(".") else{
            errorMassage = "Please enter valid email."
            return false
        }
        return true
    }
}
