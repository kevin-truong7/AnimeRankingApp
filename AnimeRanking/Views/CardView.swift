//
//  CardView.swift
//  AnimeRanking
//
//  Created by Kevin Truong on 2023-02-26.
//

// This file is to make a custom appearance for each anime instead of having just text on a list
// in the AnimeListView.
// This is NOT the view that is scene when anime is clicked

import Foundation
import SwiftUI

struct CardView: View {
    let anime: AnimeLibrary
    var body: some View {
        VStack(alignment: .leading) {
            Text(anime.title)
                .font(.headline)
        }
    }
}
