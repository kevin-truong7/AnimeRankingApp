//
//  PopularPageView.swift
//  AnimeRanking
//
//  Created by Kevin Truong on 2023-07-13.
//

import Foundation
import SwiftUI

struct PopularPageView: View {
    // a private stateo object variable that uses the fetching functions of MainPageModel()
    @StateObject private var viewModel = PageModels()
    
    var body: some View {
        NavigationView {
            // entire view to be vertically scrollable
            VStack(alignment: .center) {
                // Category Title
                Text("Popular Anime Rank")
                    .background(.white)
//                    .frame(minWidth: 100, maxWidth: .infinity, minHeight: 100, maxHeight: 300)
                    .font(.title2)
                    .bold()
//                    Spacer()
//                        .padding(.horizontal)
//                        .padding(.bottom, 8)
                ZStack {
                    if viewModel.popularAnimes.count == 0 {
                        ProgressView()
                    }
                    // showsIndicators set to false to hide scrollbar
                    ScrollView(.vertical, showsIndicators: false) {
                        // VStack to make set of anime titles to be presented in a vertical scroll
                        LazyVStack {
                            ForEach(viewModel.popularAnimes, id: \.?.id) {
                                if let item = $0 {
                                    // userPreferred is written to follow the query format. refer to MediaSortedQuery
                                    CardView(title: item.title?.userPreferred ?? "",  imageUrl: item.coverImage?.large, meanScore: item.meanScore, description: item.description ?? "", genre: item.genres!)
                                        .padding(.trailing, 4)
                                        .padding()
                                }
                            }
                        }//:VStack
                        .padding(.leading, 5)
                    }//:HScrollView
                    .frame(minHeight: 180)
                    .onAppear {
                        viewModel.getPopularAnimes()
                    }
                } // ZStack
                .background(
                Image("Demon Slayer Wallpaper")
                    .resizable())
                .ignoresSafeArea(.all, edges: .bottom)
                /// spacer to prevent tab bar from blocking content
                Spacer()
            } //: VStack
        } //: NavigationView
    } //: var body
} //: struct

struct PopularPageView_Previews: PreviewProvider {
    static var previews: some View {
        PopularPageView()
    }
}
