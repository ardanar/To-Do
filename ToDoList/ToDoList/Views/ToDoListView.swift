//
//  ToDoListItemsView.swift
//  ToDoList
//
//  Created by Arda Nar on 20.01.2024.
//

import SwiftUI
import Firebase
import FirebaseFirestore

struct ToDoListView: View {
    @StateObject var viewModel: ToDoListViewViewModel
    @FirestoreQuery var items: [ToDoListItem]
    
    private let userId: String
    
    init(userId: String){
        self.userId = userId
        // users/<id>/todos/<entries>
        self._items = FirestoreQuery(collectionPath: "Users/\(userId)/todos")
        self._viewModel = StateObject(wrappedValue: ToDoListViewViewModel(userId: userId))
    }
    
    var body: some View {
        NavigationView{
            VStack{
                List(items){ item in
                    ToDoListItemView(item: item)
                        .swipeActions{
                            Button(action: {
                                // Delete
                                viewModel.delete(id: item.id)
                            }, label: {
                                Text("Delete")
                            }).tint(.red)
                        }
                }
            }
            .navigationTitle("To Do List")
            .toolbar{
                Button(action: {
                    viewModel.showingNewItemView = true
                }, label: {
                    Image(systemName: "plus")
                })
            }
            .sheet(isPresented: $viewModel.showingNewItemView, content: {
                NewItemView(newItemPresented: $viewModel.showingNewItemView)
            })
        }
    }
}

#Preview {
    ToDoListView(userId: "k3VT52gvzEZkaWQZU6TLrKF2Gd23")
}
