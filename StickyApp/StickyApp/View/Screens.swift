//
//  Screens.swift
//  StickyApp
//
//  Created by ÖMER  on 25.03.2025.
//

import SwiftUI

struct Screens: View {
    // Tekrar kullanılabilir component sayfası oldu
    var image:ImageResource
    var title: String
    var detail: String
    @Binding var currentView: Int
    @State var show = false
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 20){
            Spacer()
            Image(image)
                .resizable().scaledToFill()
                .frame(width: 200, height: 200)
                .frame(maxWidth: .infinity)
                .scaleEffect( show ? 1 : 0 )
            Spacer()
            Text(title)
                .font(.largeTitle)
                .fontWeight(.bold)
                .scaleEffect( show ? 1 : 0 , anchor: .leading)
                .animation(.smooth.delay(0.4), value: show) // delay ile gecikme
            Text(detail)
                .scaleEffect( show ? 1 : 0 , anchor: .leading)
                .animation(.smooth.delay(0.8), value: show)
            Spacer()
            Button{
                // OnboardingView sayfasındaki currentview değeri ile bağlandı . Burda yapılan değişiklik ordaki değeri günceller
                withAnimation{
                    currentView += 1
                }
            }label: {
                Text("Continue")
                    .foregroundStyle(.white)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity)
                    .frame(height: 55)
                    .background(.black, in: .rect(cornerRadius: 15))
            }
            .scaleEffect( show ? 1 : 0 , anchor: .leading)
            .animation(.smooth.delay(1.2), value: show) // delay ile gecikme
            Spacer()
        }
        .padding(.horizontal)
        .onAppear{
            withAnimation{
                show.toggle()
            }
        }
        
        
    }
}

#Preview {
    Screens(image: .sticky, title: "Sticky Note", detail: "You can choose different stickers in shape and color to suit your tasks.", currentView: .constant(1))
}
