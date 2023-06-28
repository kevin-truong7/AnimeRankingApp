//
//  HomePageViewController.swift
//  AnimeRanking
//
//  Created by Kevin Truong on 2023-02-28.
//

import Foundation
import AnimeRankingSchema
import Apollo

struct APIData {
    
    func queryAllAnime() {
        apolloClient.fetch(query: LoadAnimesQuery(mediaId: 1)) { result in
            guard let data = try? result.get().data else { return }
            print(data)
        }
    }
}
