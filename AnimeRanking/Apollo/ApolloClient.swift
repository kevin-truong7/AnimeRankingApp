//
//  ApolloClient.swift
//  AnimeRanking
//
//  Created by Kevin Truong on 2023-02-28.
//

import Foundation
import Apollo

let apolloClient = ApolloClient(url: URL(string: "https://graphql.anilist.co")!)
