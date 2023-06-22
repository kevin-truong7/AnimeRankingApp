//
//  MainPageView.swift
//  AnimeRanking
//
//  Created by Kevin Truong on 2023-06-21.
//

import SwiftUI

struct MainPageView: View {
    @StateObject private var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationView {
            // entire view to be vertically scrollable
            VStack(alignment: .center) {
                // Category Title
                Text("Current Animes")
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
                } // ZStack
            } // VStack
        } // NavigationView
    }
}

struct MainPageView_Previews: PreviewProvider {
    static var previews: some View {
        MainPageView()
    }
}
