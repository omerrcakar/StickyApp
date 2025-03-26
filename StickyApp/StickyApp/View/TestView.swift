//
//  TestView.swift
//  StickyApp
//
//  Created by ÖMER  on 26.03.2025.
//

import SwiftUI

struct dataModel:Identifiable{
    var id = UUID()
    var name: String
    var position: CGPoint
}

struct TestView: View {
    @State var vmItems: [dataModel] = []
    @State var isDraggingOverTrash: Bool = false

    var body: some View {
       
        ZStack {
            ForEach(vmItems) { item in
                ZStack{
                    Image(.note2)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 150, height: 150)
                    Text(item.name)
                }
                .position(item.position)
                .gesture(
                    DragGesture()
                        .onChanged{ value in
                            withAnimation(.linear){
                                if let index = vmItems.firstIndex(where: {$0.id == item.id}){
                                    vmItems[index].position = value.location
                                }
                                isDraggingOverTrash = (30...130).contains(value.location.x) && (300...450).contains(value.location.y)
                            }
                        }
                        .onEnded{ value in
                            if isDraggingOverTrash{
                                vmItems.removeAll{$0.id == item.id}
                            }
                            isDraggingOverTrash = false
                        }
                )
            }
            
            Button{
                vmItems.append(dataModel(name: "the new", position: CGPoint(x: 100, y: 100)))
            }label: {
                Text("Add")
                    .font(.largeTitle)
            }
            .frame(maxHeight: .infinity, alignment: .bottom)
            
            
            Image(systemName: isDraggingOverTrash ? "trash.fill" : "trash")
                .foregroundStyle(.white)
                .padding()
                .background(isDraggingOverTrash ? .pink : .black, in: Circle())
                .opacity(isDraggingOverTrash ? 0.7 : 1)
                .scaleEffect(isDraggingOverTrash ? 1.3 : 1)
                .position(x: 45, y: 375)
                .animation(.spring, value: isDraggingOverTrash)
            
        }
    }
    
    
    
}

#Preview {
    TestView()
}
