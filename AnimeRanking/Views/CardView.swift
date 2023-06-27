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
    var description: String
    
    var body: some View {

        // information displayed and laid out in cardview
        HStack {
            VStack{
                AnimeCover(imageUrl: imageUrl, width: CardView.coverWidth, height: CardView.coverHeight, cancelOnDisappear: true)
    //                .padding(1)
            }
            .padding(.leading, 22)
            VStack(alignment: .leading) {
                Text(title)
                    .font(.system(size: 20))
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.primary)
//                    .padding(.bottom, 1)
//                    .padding()
//                    .frame(width: CardView.coverWidth, alignment: .leading)
                
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
                Text(description)
                    .multilineTextAlignment(.leading)
                    .lineLimit(10)

            }
            .padding()
            .frame(minHeight: CardView.coverHeight + 54, alignment: .top)
        } // HStack - Houses the entire card
        .background(.white)
        .cornerRadius(20) /// make the background rounded
        .overlay( /// apply a rounded border
            RoundedRectangle(cornerRadius: 20)
                .stroke(.black, lineWidth: 1)
                .shadow(radius: 20)
        )
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        LazyHStack(alignment: .top) {
            CardView(title: "Kimetsu no Yaiba: Katana", imageUrl: "", meanScore: 78, description: "this anime...")
                .previewLayout(.sizeThatFits)
//            CardView(title: "One Piece", imageUrl: "")
//                .previewLayout(.sizeThatFits)
        }
    }
}
