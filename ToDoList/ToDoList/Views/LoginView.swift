//
//  LoginView.swift
//  ToDoList
//
//  Created by Arda Nar on 20.01.2024.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationView{
            VStack{
                // Header
                
                HeaderView(degrees: 15, background: .pink, title: "To Do List", subtitle: "Get Things Done")
               
                
                // Login Form
                
                Form{
                    
                    if !viewModel.errorMassage.isEmpty{
                        Text(viewModel.errorMassage)
                            .foregroundColor(.red)
                    }
                    
                    TextField("Email Address", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(.none)
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    TLButton(background: .blue, title: "Log In"){
                        
                        viewModel.login()
                    }
                }
                
                // Create Account
                
                VStack{
                    Text("New Around Here?")
                    NavigationLink("Create New Account", destination: RegisterView())
                }
                .padding(.bottom, 50)
                
            }.offset(y: 40)
        }
        }
}

#Preview {
    LoginView()
}
