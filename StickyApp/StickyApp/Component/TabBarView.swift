//
//  TabBarView.swift
//  StickyApp
//
//  Created by ÖMER  on 26.03.2025.
//

import SwiftUI

struct TabBarView: View {
    
    @Binding var selectedTab:TabBarViews
    @Environment(\.colorScheme) var isdark
    
    var body: some View {
        HStack(spacing: 45){
            Button{
                selectedTab = .home
            }label: {
                Image(systemName: "house")
                    .foregroundStyle(selectedTab == .home ? Color.black : Color.gray)
            }
            
            Button{
                selectedTab = .list
            }label: {
                Image(systemName: "list.bullet.rectangle.portrait")
                    .foregroundStyle(selectedTab == .list ? AnyShapeStyle(.black) : AnyShapeStyle(.gray))
            }
            
            Spacer()
            
            Button{
                selectedTab = .notif
            }label: {
                Image(systemName: "bell")
                    .foregroundStyle(selectedTab == .notif ? AnyShapeStyle(.black) : AnyShapeStyle(.gray))
            }
            
            Button{
                selectedTab = .search
            }label: {
                Image(systemName: "magnifyingglass")
                    .foregroundStyle(selectedTab == .search ? AnyShapeStyle(.black) : AnyShapeStyle(.gray))
            }
            
        }
        .padding(.horizontal, 35)
        .overlay{
            Button{
                
            }label: {
                Image(systemName: "plus")
                    .padding(20)
                    .background(isdark == .dark ? Color.gray : .black, in: Circle())
                    .foregroundStyle(.white)
            }
            .offset(y: -40)
            .font(.title2)
            .bold()
        }
    }
    
    
}

#Preview {
    TabBarView(selectedTab: .constant(.home))
}
