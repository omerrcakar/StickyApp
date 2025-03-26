//
//  AddNewNoteView.swift
//  StickyApp
//
//  Created by ÖMER  on 26.03.2025.
//

import SwiftUI

struct AddNewNoteView: View {
    
    @State var viewModel: Model
    @Binding var show: Bool
    @State var selected = ""
    @FocusState var isTyping: Bool // dokununca true döner diğer halde false buna göre title değerini ayarlar
    @State var title = ""
    @State var title2 = " Quick Note"
    
    var cards: [String] = ["note", "note1", "note2"]
    
    
    var body: some View {
        ZStack {
            Color.clear
                .contentShape(Rectangle())
                .onTapGesture {
                    withAnimation{
                        show = false
                    }
                }
            VStack(spacing: 15){
                TextEditor(text: isTyping ? $title : $title2) // Text editore tıklanınca ayrı bir title gözükecek tıklamadan önce ayrı
                    .focused($isTyping)
                    .font(.custom("JustAnotherHand-Regular", size: 25))
                    .frame(height: 70)
                    .foregroundStyle(title.count >= 60 ? .red : .primary)
                    .clipShape(.rect(cornerRadius: 10))
                    .overlay(alignment: .bottomTrailing){
                        Text("\(title.count) / 60")
                            .foregroundStyle(title.count >= 60 ? .red : .primary)
                            .padding(.horizontal, 5)
                            .padding(.bottom, 5)
                    }
                
                HStack(spacing: 10){
                    ForEach(cards, id: \.self){ item in
                        Image(item)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 55, height: 55)
                            .scaleEffect(selected == item ? 1.5 : 1)
                            .animation(.spring, value: selected)
                            .onTapGesture {
                                selected = item
                            }
                    }
                }
                
                Button{
                    withAnimation{
                        viewModel.notes.append(NoteModel(card: selected, note: title, position: CGPoint(x: 100, y: 200)))
                        title = ""
                        show = false
                        viewModel.tasks += 1
                    }
                }label: {
                    Text("Save")
                        .bold()
                        .frame(maxWidth: .infinity)
                        .foregroundStyle(.white)
                }
            }
            .padding(.horizontal, 10)
            .frame(maxWidth: .infinity)
            .frame(height: 200)
            .background(.black, in: .rect(cornerRadius: 20))
            .padding()
            .frame(maxHeight: .infinity, alignment: .bottom)
        }
    }
    
    
}

#Preview {
    AddNewNoteView(viewModel: Model(), show: .constant(false))
}
