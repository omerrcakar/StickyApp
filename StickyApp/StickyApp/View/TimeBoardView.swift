//
//  TimeBoardView.swift
//  StickyApp
//
//  Created by ÖMER  on 25.03.2025.
//

import SwiftUI

struct TimeBoardView: View {
    
    @State var viewModel = Model()
    
    var body: some View {
        VStack(spacing: 60){
            ProfileView()
            ProgressView(viewModel: viewModel)
            HStack{
                NoteOverview(viewModel: viewModel)
                Spacer()
                InfoView(viewModel: viewModel)
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
