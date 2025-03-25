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
    @State var shapeThree = Color.blue
    @State var shapeFour = Color.indigo
    
    // Random color seçme ve state değişkenlere atayıp güncellemek için
    let colors: [Color] = [.red, .orange, .blue, .indigo, .yellow]
    
    var body: some View {
        GeometryReader{ geo in
            ZStack{
                Image(.shape)
                    .renderingMode(.template)// Image rengi değiştirmek için bunu kullan
                    .resizable()
                    .frame(width: 450, height: 450)
                    .offset(x: -150, y: -250)
                    .foregroundStyle(shapeOne)
                Image(.shape)
                    .renderingMode(.template)// Image rengi değiştirmek için bunu kullan
                    .resizable()
                    .frame(width: 470, height: 470)
                    .offset(x: 150, y: -350)
                    .foregroundStyle(shapeTwo)
                Image(.shape)
                    .renderingMode(.template)// Image rengi değiştirmek için bunu kullan
                    .resizable()
                    .frame(width: 550, height: 550)
                    .offset(x: 150, y: 100)
                    .foregroundStyle(shapeThree)
                Image(.shape)
                    .renderingMode(.template)// Image rengi değiştirmek için bunu kullan
                    .resizable()
                    .frame(width: 650, height: 650)
                    .offset(x: -150, y: 200)
                    .foregroundStyle(shapeFour)
            }
            .blur(radius: 40)
            .onAppear{
                Timer.scheduledTimer(withTimeInterval: 1, repeats: true){ _ in
                    withAnimation(.linear(duration: 3)){
                        let shuffledColors = colors.shuffled() // Liste karıştrıldı
                        shapeOne = shuffledColors[0]
                        shapeTwo = shuffledColors[1]
                        shapeThree = shuffledColors[2]
                        shapeFour = shuffledColors[3]
                    }
                }
                
            }
            .frame(width: geo.size.width, height: geo.size.height)
            
        }
        
    }
}

#Preview {
    BlurGradient()
}
