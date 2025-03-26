//
//  BorderView.swift
//  StickyApp
//
//  Created by ÖMER  on 26.03.2025.
//

import SwiftUI
import Observation

struct NoteModel: Identifiable {
    var id = UUID()
    var card:String
    var note:String
    var position:CGPoint
}

@Observable
class Model{
    var notes:[NoteModel] = []
    var completed = 0
    var tasks = 0
    var remaing = 0
}

struct BorderView: View {
    @State var viewModel = Model()
    @State var isDraggingOverTrash: Bool = false
    @State var edit: Bool = false
    
    var body: some View {
        ZStack{
            ZStack{
                ForEach(viewModel.notes){ item in
                    ZStack{
                        Image(item.card)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 170, height: 170)
                        Text(item.note)
                            .font(.custom("JustAnotherHand-Regular", size: 20))
                            .frame(width: 120, height: 80)
                            .foregroundStyle(.black)
                    }
                    .position(item.position)
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                withAnimation(.linear){
                                    if let index = viewModel.notes.firstIndex(where: {$0.id == item.id}) {
                                        viewModel.notes[index].position = value.location
                                    }
                                    isDraggingOverTrash = (30...130).contains(value.location.x) && (300...450).contains(value.location.y)
                                }
                            }
                            .onEnded{ value in
                                if edit{
                                    if isDraggingOverTrash{
                                        viewModel.notes.removeAll{$0.id == item.id}
                                    }
                                    isDraggingOverTrash = false
                                }
                            }
                        
                    )
                }
                if edit{
                    trashIcon
                }
                
                
            }
            
            VStack{
                HStack{
                    Spacer()
                    Button{
                        withAnimation{
                            edit.toggle()
                        }
                    }label: {
                        Image(systemName: "pencil.slash")
                            .padding(10)
                            .background(.black, in: Circle())
                            .foregroundStyle(.white)
                            .padding()
                    }
                }
                Spacer()
            }
            
        }
    }
    
    
    private var trashIcon: some View {
        Image(systemName: isDraggingOverTrash ? "trash.fill" : "trash")
            .foregroundStyle(.white)
            .padding()
            .background(isDraggingOverTrash ? .pink : .black, in: Circle())
            .opacity(isDraggingOverTrash ? 0.7 : 1)
            .scaleEffect(isDraggingOverTrash ? 1.3 : 1)
            .frame(width: 50, height: 50)
            .position(x: 45, y: 375)
            .animation(.spring, value: isDraggingOverTrash)
    }
    
    
}

#Preview {
    BorderView()
}
