//
//  TimeBoardView.swift
//  StickyApp
//
//  Created by ÖMER  on 25.03.2025.
//

import SwiftUI

struct TimeBoardView: View {
    
    
    var body: some View {
        VStack(spacing: 60){
            ProfileView()
            ProgressView()
            HStack{
                NoteOverview()
                Spacer()
                InfoView()
                    .frame(height: 400, alignment: .top)
            }
            Spacer()
        }
        .padding(.horizontal)
    }
    
    
}

#Preview {
    TimeBoardView()
}
