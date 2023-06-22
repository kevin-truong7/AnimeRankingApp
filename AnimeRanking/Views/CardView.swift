//
//  CardView.swift
//  AnimeRanking
//
//  Created by Kevin Truong on 2023-06-22.
//

import SwiftUI

struct CardView: View {
    static let coverWidth: CGFloat = 90
    static let coverHeight: CGFloat = 130
    
    var title: String
    var imageUrl: String?
    var meanScore: Int?
    
    var body: some View {
        // this is creates the layout for one title
        VStack(alignment: .leading) {
            AnimeCover(imageUrl: imageUrl, width: CardView.coverWidth, height: CardView.coverHeight, cancelOnDisappear: true)
                .padding(.top, 4)
            
            Text(title)
                .font(.system(size: 15))
                .lineLimit(2)
                .multilineTextAlignment(.leading)
                .foregroundColor(.primary)
                .padding(.bottom, 1)
                .frame(width: CardView.coverWidth, alignment: .leading)
            
            if meanScore != nil {
                HStack(alignment: .bottom, spacing: 4) {
                    Image(systemName: "hand.thumbsup.fill")
                        .font(.footnote)
                        .foregroundColor(.gray)
                    Text("\(meanScore!)%")
                        .font(.footnote)
                        .foregroundColor(.gray)
                }
                .padding(.bottom, 1)
            }
        }
        .frame(minHeight: CardView.coverHeight + 54, alignment: .top)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        LazyHStack(alignment: .top) {
            CardView(title: "Kimetsu no Yaiba: Katana", imageUrl: "", meanScore: 78)
                .previewLayout(.sizeThatFits)
            CardView(title: "One Piece", imageUrl: "")
                .previewLayout(.sizeThatFits)
        }
    }
}
