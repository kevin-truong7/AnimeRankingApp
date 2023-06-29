//
//  DetailsView.swift
//  AnimeRanking
//
//  Created by Kevin Truong on 2023-06-27.
//

import SwiftUI
// Package converts html formatted text to user friendly text
import RichText

struct DetailsView: View {
    
    // not sure if needed
    @Environment(\.dismiss) private var dismiss
    
    var detailDescription: String
    var detailTitle: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(detailTitle)
                .font(.system(size: 20))
                .bold()
                .padding([.bottom, .top], 1)
                .padding(.leading, 5)
            ScrollView {
                RichText(html: detailDescription)
            }
            .padding()
//            .frame(maxHeight: 600, alignment: .top)
        }
        .background(
        Image("light-pink")
            .ignoresSafeArea(.all, edges: .all))
        
    }
}

