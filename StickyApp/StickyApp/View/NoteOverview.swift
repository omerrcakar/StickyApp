//
//  NoteOverview.swift
//  StickyApp
//
//  Created by ÖMER  on 25.03.2025.
//

import SwiftUI

struct NoteOverview: View {
    var body: some View {
        VStack{
            StickerNote(image: .note, title: "1. \n Click on + button", degrees: 3)
            StickerNote(image: .note1, title: "2. \n Type your task", degrees: -4)
            StickerNote(image: .note2, title: "3. \n Choose the sticker \n color", degrees: 1)
        }
    }
}

#Preview {
    NoteOverview()
}
