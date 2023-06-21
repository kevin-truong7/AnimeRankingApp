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
    
    @StateObject private var viewModel = HomeViewModel()
        
    var body: some Scene {
        WindowGroup {
            // Current anime grouping
            Group {
                HStack(alignment: .center) {
                    Text("Current Animes")
                        .font(.title2)
                        .bold()
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.top, 8)
                ZStack {
                    if viewModel.trendingAnimes.count == 0 {
                        ProgressView()
                    }
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack(alignment: .top) {
                            ForEach(viewModel.trendingAnimes, id: \.?.id) {
                                if let item = $0 {
                                    VListItemView(title: item.title?.userPreferred ?? "", imageUrl: item.coverImage?.large, meanScore: item.meanScore)
                                        .padding(.trailing, 4)
                                }
                            }
                        }//:HStack
                        .padding(.leading, 14)
                    }//:HScrollView
                    .frame(minHeight: 180)
                    .onAppear {
                        viewModel.getTrendingAnimes()
                    }
                }//:ZStack
            }
        }
    }
}

