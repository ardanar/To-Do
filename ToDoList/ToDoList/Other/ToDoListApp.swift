//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Arda Nar on 20.01.2024.
//

import SwiftUI
import Firebase

@main
struct ToDoListApp: App {
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
