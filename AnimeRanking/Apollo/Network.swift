//
//  ApolloClient.swift
//  AnimeRanking
//
//  Created by Kevin Truong on 2023-02-28.
//

import Foundation
import Apollo

class Network {
    static let shared = Network()
    
//    private(set) lazy var apollo: ApolloClient = {
//        let sessionClient = URLSessionClient()
//        let store = ApolloStore(cache: InMemoryNormalizedCache())
////        let networkProvider = NetworkInterceptorProvider
//        let apolloClient = ApolloClient(networkTransport: tr, store: <#T##ApolloStore#>)
//        return apolloClient
//    }()
    
    private(set) lazy var apollo = ApolloClient(url: URL(string: "https://graphql.anilist.co")!)
}

let apolloClient = ApolloClient(url: URL(string: "https://graphql.anilist.co")!)
