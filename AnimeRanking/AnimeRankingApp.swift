//
//  AnimeRankingApp.swift
//  AnimeRanking
//
//  Created by Kevin Truong on 2023-02-26.
//

import SwiftUI

// This @main indicates the app's main point of entry during launch
@main
struct AnimeRankingApp: App {
    
    // @StateObject wrapper to be used only once per project, which is responsible for creating the object. All other views that share this object, uses @ObservedObject
    @StateObject private var viewModel = PageModels()
        
    var body: some Scene {
        WindowGroup {
            /// displays view below during app launch
           Tabs()
        }
    }
}

