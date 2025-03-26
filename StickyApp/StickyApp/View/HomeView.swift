//
//  HomeView.swift
//  StickyApp
//
//  Created by ÖMER  on 25.03.2025.
//

import SwiftUI

enum TabBarViews{
    case home, list,add,notif,search
}

struct HomeView: View {
    
    @State var selectTab = TabBarViews.home
    
    var body: some View {
        ZStack{
            switch selectTab{
            case .home:
                TimeBoardView()
            case .list:
                Text("List View")
            case .add:
                Text("Add View")
            case .notif:
                Text("Notif View")
            case .search:
                Text("Search View")
            }
            TabBarView(selectedTab: $selectTab)
                .frame(maxHeight: .infinity, alignment: .bottom)
        }
    }
    
    
    
}

#Preview {
    HomeView()
}
