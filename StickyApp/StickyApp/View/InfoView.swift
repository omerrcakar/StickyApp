//
//  InfoView.swift
//  StickyApp
//
//  Created by ÖMER  on 25.03.2025.
//

import SwiftUI

struct InfoView: View {
    
    @StateObject var timerViewModel = TimeViewModel()
    
    var body: some View {
        VStack(spacing: 30) {
            VStack(alignment: .leading){
                Text(Date().formatted(.dateTime.day()))
                    .font(.system(size: 110))
                Text("0 Avaliable task")
                    .bold()
                Text(Date().formatted(.dateTime.weekday(.wide)))
                }
            
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 130, height: 2)
                .foregroundStyle(.gray.opacity(0.3))
                .offset(y: 5)
            
            VStack(alignment: .leading){
                Text(timerViewModel.currentTime)
                    .font(.system(size: 33))
                Text("Last task is")
                    .bold()
                Text("No task yet all you need is to add new one")
                    .frame(width: 128, height: 52, alignment: .topLeading)
                    .font(.footnote)
            }
            
            
        }
        
    }
}

#Preview {
    InfoView()
}
