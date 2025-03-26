//
//  StickerNote.swift
//  StickyApp
//
//  Created by ÖMER  on 25.03.2025.
//

import SwiftUI

struct StickerNote: View {
    
    var image:ImageResource
    var title:String
    var degrees:Double
    
    var body: some View {
        ZStack{
            Image(image)
                .resizable()
                .scaledToFill()
                .frame(width: 145, height: 120)
            Text(title)
                .font(.custom("JustAnotherHand-Regular", size: 25))
        }
        .rotationEffect(.degrees(degrees))
        .offset(y: -10)
    }
}


