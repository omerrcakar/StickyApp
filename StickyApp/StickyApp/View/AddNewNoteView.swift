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
        VStack{
            TextEditor(text: isTyping ? $title : $title2)
                .focused($isTyping)
                .font(.custom("JustAnotherHand-Regular", size: 25))
                .frame(height: 70)
                .foregroundStyle(title.count >= 60 ? .red : .primary)
                .clipShape(.rect(cornerRadius: 10))
                .overlay(alignment: .bottomTrailing){
                    Text("\(title.count) / 60")
                        .foregroundStyle(title.count >= 60 ? .red : .primary)
                        .padding(.horizontal, 5)
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
        .frame(height: 250)
        .background(.black, in: .rect(cornerRadius: 20))
        .padding()
    }
    
    
}

#Preview {
    AddNewNoteView(viewModel: Model(), show: .constant(false))
}
