//
//  OnboardingView.swift
//  StickyApp
//
//  Created by ÖMER  on 25.03.2025.
//

import SwiftUI

struct OnboardingView: View {
    
    @State var currentView = 0
    
    var body: some View {
        ZStack{
            if currentView <= 2 {
                BlurGradient()
                    .transition(.opacity)
            }
            switch currentView {
            case 0:
                Screens(image: .sticky, title: "Sticky Note", detail: "You can choose stickers and color to suit your tasks.", currentView: $currentView)
            case 1:
                Screens(image: .board, title: "Dragging Board", detail: "You can drag a memo to any location inside the whiteboard.",currentView: $currentView)
            case 2:
                Screens(image: .progress, title: "Tracking", detail: "Track the progress of tasks that have been completed and remain.",currentView: $currentView)
            default:
                HomeView()
                    .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .trailing)))
            }
        }
    }
}

#Preview {
    OnboardingView()
}
