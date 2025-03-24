//
//  ContentView.swift
//  StickyApp
//
//  Created by ÖMER  on 24.03.2025.
//

import SwiftUI

struct BlurGradient: View {
    
    @State var shapeOne = Color.red
    @State var shapeTwo = Color.orange
    @State var shapeThree = Color.purple
    @State var shapeFour = Color.indigo
    
    // Random color seçme ve state değişkenlere atayıp güncellemek için
    let colors: [Color] = [.red, .orange, .purple, .indigo]
    
    var body: some View {
        ZStack{
            Image(.shape)
                .renderingMode(.template)// Image rengi değiştirmek için bunu kullan
                .resizable()
                .frame(width: 400, height: 400)
                .offset(x: -150, y: -250)
                .foregroundStyle(shapeOne)
            Image(.shape)
                .renderingMode(.template)// Image rengi değiştirmek için bunu kullan
                .resizable()
                .frame(width: 450, height: 450)
                .offset(x: 150, y: -350)
                .foregroundStyle(shapeTwo)
            Image(.shape)
                .renderingMode(.template)// Image rengi değiştirmek için bunu kullan
                .resizable()
                .frame(width: 500, height: 500)
                .offset(x: 150, y: 100)
                .foregroundStyle(shapeThree)
            Image(.shape)
                .renderingMode(.template)// Image rengi değiştirmek için bunu kullan
                .resizable()
                .frame(width: 600, height: 600)
                .offset(x: -150, y: 200)
                .foregroundStyle(shapeFour)
        }
        
    }
}

#Preview {
    BlurGradient()
}
