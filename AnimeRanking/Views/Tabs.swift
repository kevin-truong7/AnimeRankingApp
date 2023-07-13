//
//  Tabs.swift
//  AnimeRanking
//
//  Created by Kevin Truong on 2023-07-13.
//

import Foundation
import SwiftUI

struct Tabs: View {
    var body: some View {
        TabView {
            /// one of the tab views to be the main page
            MainPageView()
                .tabItem {
                    Text("Trending")
                        .font(.title)
                }
            PopularPageView()
                .tabItem {
                    Text("Popular")
//                    Label("Popular", systemImage: "house")
                }
        }
//        .frame(height: 20)
    }
}

struct Tabs_Preview:PreviewProvider {
    static var previews: some View {
        Tabs()
    }
}
