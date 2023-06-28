//
//  MainPageModel.swift
//  AnimeRanking
//
//  Created by Kevin Truong on 2023-06-22.
//

import Foundation
import AnimeRankingSchema

// This file is used to build models of sections to be displayed on main page. It is similar to how sections of react tutorial was built. In the future, we can have more functions for different sections of the home page. For now, we will have one function for one section that displays the current animes. These models will be used to fetch the query data from the api, instead of fetching data from the views.
// These models dont construct the layout, but instead fetches desired data from api from each function. So far we only have once function

class MainPageModel: ObservableObject {
    private let now = Date.now
    
    // current anime model displayed on the main page. Use this model to fetch api for all data to be displayed on the main page?
    var pageTrendingAnime = 1
    var hasNextPageTrendingAnime = true
    var pageAnimeDescription = 1
    
    
    // @Published used so that SwiftUI will automatically monitor for changes, and reinvoke the body property of any views that rely on the data
    // MediaSortedQuery.Data.Page.Medium is written in this way to access data within the structure. It is visualized as digging deeper through the curly braces
    @Published var trendingAnimes = [MediaSortedQuery.Data.Page.Medium?]()

    @Published var animeGenre = MediaSortedQuery.Data.Page.Medium?.self
    
    func getTrendingAnimes(page: Int = 1) {
        Network.shared.apollo.fetch(query: MediaSortedQuery(page: .some(page), perPage: .some(10), type: .some(.case(.anime)), sort: .some([.case(.trendingDesc)]))) { [weak self] result in
            switch result {
            case .success(let graphQLResult):
                if let page = graphQLResult.data?.page {
                    if let media = page.media {
                        self?.trendingAnimes.append(contentsOf: media)
                    }
                    self?.hasNextPageTrendingAnime = page.pageInfo?.hasNextPage ?? false
                    self?.pageTrendingAnime = (page.pageInfo?.currentPage ?? self?.pageTrendingAnime ?? 1) + 1
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
