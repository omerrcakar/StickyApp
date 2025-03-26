//
//  NoteOverview.swift
//  StickyApp
//
//  Created by ÖMER  on 25.03.2025.
//

import SwiftUI

struct NoteOverview: View {
    var viewModel: Model
    var body: some View {
        
        if viewModel.notes.isEmpty{
            VStack{
                StickerNote(image: .note, title: "1. \n Click on + button", degrees: 3)
                StickerNote(image: .note1, title: "2. \n Type your task", degrees: -4)
                StickerNote(image: .note2, title: "3. \n Choose the sticker \n color", degrees: 1)
            }
        }else{
            VStack {
                ForEach(viewModel.notes.prefix(3)){ item in
                    ZStack{
                        Image(item.card)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 145,height: 120)
                        Text(item.note)
                            .font(.custom("JustAnotherHand-Regular", size: 20))
                            .frame(width: 100, height: 80)
                            .foregroundStyle(.black)
                    }
                }
                
            }
            .frame(height: 350, alignment: .top)
        }
        
    }
}

#Preview {
    NoteOverview(viewModel: Model())
}
