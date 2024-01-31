//
//  RegisterView.swift
//  ToDoList
//
//  Created by Arda Nar on 20.01.2024.
//

import SwiftUI

struct RegisterView: View {
    
    @StateObject var viewModel = RegisterViewViewModel()
    
    var body: some View {
        NavigationView{
            VStack{
                // Header
                
                HeaderView(degrees: -15, background: .orange, title: "Register", subtitle: "Start Organizing Todos")
                    Spacer()
                // Login Form
                
                Form{
                    TextField("Your Name", text: $viewModel.name)
                        .textFieldStyle(DefaultTextFieldStyle())
                    TextField("Email Address", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(.none)
                        .autocorrectionDisabled()
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    TLButton(background: .green, title: "Create Account"){
                        viewModel.register()
                    }
                }
                Spacer()
            }
        }
    }
}

#Preview {
    RegisterView()
}
