//
//  DetailsView.swift
//  AnimeRanking
//
//  Created by Kevin Truong on 2023-06-27.
//

import SwiftUI

struct DetailsView: View {
    
    // not sure if needed
    @Environment(\.dismiss) private var dismiss
    
    var detailDescription: String
    
    var body: some View {
        VStack {
            ScrollView {
                Text(detailDescription)
            }
            .padding()
//            .frame(maxHeight: 600, alignment: .top)
        }
        .background(
        Image("light-pink")
            .resizable()
            .ignoresSafeArea(.all, edges: .all))
        
    }
}

