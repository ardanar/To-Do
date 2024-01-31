//
//  TLButton.swift
//  ToDoList
//
//  Created by Arda Nar on 23.01.2024.
//

import SwiftUI

struct TLButton: View {
    
    var background: Color
    var title: String
    var action: () -> Void
    
    var body: some View {
        
        Button(action: {
            action()
        }, label: {
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(background)
                
                Text(title)
                    .foregroundColor(.white)
                    .bold()
            }
        })
    }
}

#Preview {
    TLButton(background: .blue, title: "value"){
        // action
    }
}
