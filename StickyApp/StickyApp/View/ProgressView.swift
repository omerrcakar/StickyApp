//
//  ProgressView.swift
//  StickyApp
//
//  Created by ÖMER  on 25.03.2025.
//

import SwiftUI

struct ProgressView: View {
    
    var viewModel: Model
    
    var body: some View {
        HStack(spacing: 50) {
            ZStack{
                Circle()
                    .stroke(Color.gray, lineWidth: 8)
                    .frame(width: 120, height: 120)
                    .opacity(0.3)
                Circle()
                    .trim(from: 0, to: Double(viewModel.completed) / Double(viewModel.tasks))
                    .stroke(style: StrokeStyle(lineWidth: 8, lineCap: .round, lineJoin: .round))
                    .frame(width: 120, height: 120)
                    .foregroundStyle(.blue.opacity(0.4))
                    .rotationEffect(.degrees(-90))
                VStack(spacing: 3){
                    Text("\(viewModel.tasks - viewModel.completed)")
                        .font(.system(size: 40))
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 30, height: 3)
                        .foregroundStyle(.red.opacity(0.4))
                }
                .offset(y: -2)
            }
            
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 1,height: 100)
                .foregroundStyle(.gray.opacity(0.3))
            
            VStack(alignment: .leading){
                Text("Weekly Progress")
                    .font(.system(size: 17))
                    .bold()
                Group{
                    HStack{
                        Circle()
                            .frame(width: 8, height: 8)
                            .foregroundStyle(.blue.opacity(0.4))
                        Text("Complete Task")
                            .font(.system(size: 14))
                    }
                    HStack{
                        Circle()
                            .frame(width: 8, height: 8)
                            .foregroundStyle(.red.opacity(0.4))
                        Text("Remain Task")
                            .font(.system(size: 14))
                    }
                }
                .offset(x: 10)
            }
        }
    }
}

#Preview {
    ProgressView(viewModel: Model())
}
