//
//  MainPageView.swift
//  AnimeRanking
//
//  Created by Kevin Truong on 2023-06-21.
//

import SwiftUI

struct MainPageView: View {
    // a private stateo object variable that uses the fetching functions of MainPageModel()
    @StateObject private var viewModel = MainPageModel()
    
    var body: some View {
        NavigationView {
            // entire view to be vertically scrollable
            VStack(alignment: .center) {
                // Category Title
                Text("Current Anime Trend Ranking")
                    .background(.white)
//                    .frame(minWidth: 100, maxWidth: .infinity, minHeight: 100, maxHeight: 300)
                    .font(.title2)
                    .bold()
//                    Spacer()
//                        .padding(.horizontal)
//                        .padding(.bottom, 8)
                ZStack {
                    if viewModel.trendingAnimes.count == 0 {
                        ProgressView()
                    }
                    // showsIndicators set to false to hide scrollbar
                    ScrollView(.vertical, showsIndicators: false) {
                        // VStack to make set of anime titles to be presented in a vertical scroll
                        LazyVStack {
                            ForEach(viewModel.trendingAnimes, id: \.?.id) {
                                if let item = $0 {
                                    // userPreferred is written to follow the query format. refer to MediaSortedQuery
                                    CardView(title: item.title?.userPreferred ?? "",  imageUrl: item.coverImage?.large, meanScore: item.meanScore, description: item.description ?? "")
                                        .padding(.trailing, 4)
                                        .padding()
                                }
                            }
                        }//:VStack
                        .padding(.leading, 5)
                    }//:HScrollView
                    .frame(minHeight: 180)
                    .onAppear {
                        viewModel.getTrendingAnimes()
                    }
                } // ZStack
                .background(
                Image("Demon Slayer Wallpaper")
                    .resizable())
                .ignoresSafeArea(.all, edges: .bottom)
            } // VStack
            
        } // NavigationView
    }
}

struct MainPageView_Previews: PreviewProvider {
    static var previews: some View {
        MainPageView()
    }
}
