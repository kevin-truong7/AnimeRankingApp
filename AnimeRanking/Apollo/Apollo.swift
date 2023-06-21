//
//  Apollo.swift
//  AnimeRanking
//
//  Created by Kevin Truong on 2023-03-13.
//

import Foundation
import Apollo

class Apollo {
    
    static let shared = Apollo()
    
    let client: ApolloClient
    
    // this init initializes an instance of 'ApolloClient' class with a specific URL and assigns it to the 'client' property of the object being constructed.
    init() {
        // unwrapping is verifying if the optional value is nil or not, and then it performs a task only if it's not nil.
        // A URL argument is an optional value, since there are many situations in which a URL may not be able to be constructed successfully, and in these cases, it is appropriate for the URL to have a value of nil.
        // "!" used for forced unwrapping.
        // The 'ApolloClient' initializer takes a 'URL' argument, which is an optional
        // value, which is possible for the 'URL' initializer to fail and return 'nil'.
        // By force unwrapping the result, the code is assuming that the 'URL' initializer
        // will always return a non-nil value, and it's converting the optional 'URL?'
        // type to a non-optional 'URL' type.
        // if the value is nil, force unwrapping can throw a fatal error
        client = ApolloClient(url: URL(string: "https://graphql.anilist.co")!)
    }
}
