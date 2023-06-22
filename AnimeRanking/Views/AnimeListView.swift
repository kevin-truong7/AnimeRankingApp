//
//  ContentView.swift
//  AnimeRanking
//
//  Created by Kevin Truong on 2023-02-26.
//

import SwiftUI
import AnimeRankingSchema

struct AnimeListView: View {
    
    @ObservedObject var viewModel: MainPageModel
    var mediaType: MediaType
    
    private let gridColumns = [
        GridItem(.adaptive(minimum: CardView.coverWidth + 15), alignment: .top)
    ]
    
    var trendingMedia: [MediaSortedQuery.Data.Page.Medium?]

    var body: some View {
        ScrollView(.vertical) {
            LazyVGrid(columns: gridColumns) {
                ForEach(trendingMedia, id: \.?.id) {
                    if let media = $0 {
                        CardView(title: media.title?.userPreferred ?? "", imageUrl: media.coverImage?.large, meanScore: media.meanScore)
                    }
                }
            }
        }
    }
}

struct AnimeListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
//            AnimeListView(anime: .constant(AnimeLibrary.sampleData))
        }
    }
}
