//
//  ToDoListItemViewViewModel.swift
//  ToDoList
//
//  Created by Arda Nar on 20.01.2024.
//

import Foundation
import Firebase

class ToDoListItemViewViewModel: ObservableObject{
    
    init(){
        
    }
    
    func toggleIsDone(item: ToDoListItem){
     var itemCopy = item
        itemCopy.setDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else{
            return
        }
        
        let db = Firestore.firestore()
        db.collection("Users")
            .document(uid)
            .collection("todos")
            .document(itemCopy.id)
            .setData(itemCopy.asDictionary())
    }
    
}
