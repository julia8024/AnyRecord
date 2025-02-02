//
//  TabView.swift
//  AniRecord
//
//  Created by 장세희 on 2/2/25.
//

import SwiftUI

struct BoTabView: View {
    private enum Tabs {
        case Record, Search
    }
    
    init() {
        let appearance = UITabBarAppearance()
        appearance.configureWithTransparentBackground()

        UITabBar.appearance().backgroundColor = UIColor(Color("DefaultColor"))
        UITabBar.appearance().standardAppearance = appearance
    }

    @State private var selectedTab: Tabs = .Record
    
    var body: some View {
        NavigationStack {
            TabView(selection: $selectedTab) {
                RecordView()
                    .tag(Tabs.Record)
                    .tabItem({
                        Image(systemName: "list.dash")
                            .environment(\.symbolVariants, .none)
                        Text("Record")
                    })
                SearchView()
                    .tag(Tabs.Search)
                    .tabItem({
                        Image(systemName: "magnifyingglass")
                            .environment(\.symbolVariants, .none)
                        Text("Search")
                    })
            }
            .accentColor(Color("DefaultTextColor"))
        }
    }
}


#Preview {
    TabView()
}
