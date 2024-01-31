//
//  HeaderView.swift
//  ToDoList
//
//  Created by Arda Nar on 21.01.2024.
//

import SwiftUI

struct HeaderView: View {
    var degrees: Double
    var background: Color
    var title: String
    var subtitle: String
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(background)
                .rotationEffect(Angle(degrees: degrees))
            
            VStack{
                Text(title)
                    .foregroundColor(.white)
                    .font(.system(size: 50))
                    .bold()
                Text(subtitle)
                    .font(.system(size: 30))
                    .foregroundColor(.white)
            }.padding(.top, 80)
            
        }
        .frame(width: UIScreen.main.bounds.width * 3, height: 350)
        .offset(y: -150)
        
    }
}

#Preview {
    HeaderView(degrees: 15, background: .blue, title: "TO DO", subtitle: "Subtitle")
}
