//
//  ToDoListViewViewModel.swift
//  ToDoList
//
//  Created by Arda Nar on 20.01.2024.
//

import Foundation
import FirebaseFirestore

class ToDoListViewViewModel: ObservableObject{
    
    @Published var showingNewItemView = false
    private let userId: String
    
    init(userId: String){
        self.userId = userId
    }
    
    func delete(id: String){
        let db = Firestore.firestore()
        db.collection("Users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
    }
    
}
