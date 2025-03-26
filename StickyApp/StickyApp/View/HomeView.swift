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
    @State var show : Bool = false
    @State var viewModel = Model()
    
    var body: some View {
        ZStack{
            switch selectTab{
            case .home:
                TimeBoardView(viewModel: viewModel)
            case .list, .add:
                BorderView(viewModel: viewModel,show: $show)
            case .notif:
                Text("Notif View")
            case .search:
                Text("Search View")
            }
            TabBarView(selectedTab: $selectTab, show: $show)
                .frame(maxHeight: .infinity, alignment: .bottom)
        }
    }
    
    
    
}

#Preview {
    HomeView()
}
