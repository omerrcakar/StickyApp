//
//  ProfileView.swift
//  StickyApp
//
//  Created by ÖMER  on 25.03.2025.
//

import SwiftUI

struct ProfileView: View {
    
    
    var body: some View {
        HStack{
            Image(systemName: "rectangle.grid.2x2")
                .padding(10)
                .bold()
                .overlay{
                    RoundedRectangle(cornerRadius: 6)
                        .stroke(lineWidth: 2)
                }
            Spacer()
            Text("TimeBoard")
                .bold()
            Spacer()
            Image(systemName: "person.crop.square.on.square.angled")
                .resizable()
                .scaledToFill()
                .frame(width: 35, height: 35)
                //.clipShape(.rect(cornerRadius: 15))
        }
        
    }
    
    
}

#Preview {
    ProfileView()
}
