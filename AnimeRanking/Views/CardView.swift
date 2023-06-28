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
    
    @State private var isPresentingDescriptionView = false
    
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
                    .lineLimit(3)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.primary)
                
                // if function in case some animes do not have a rating
                if meanScore != nil {
                    HStack(alignment: .bottom, spacing: 4) {
                        Image(systemName: "hand.thumbsup.fill")
                            .font(.footnote)
                            .foregroundColor(.yellow)
                        Text("\(meanScore!)%")
                            .font(.footnote)
                            .foregroundColor(.gray)
                    }
                    .padding(.bottom, 1)
                }
                Text(description)
                    .multilineTextAlignment(.leading)
                    .lineLimit(5)
                
                // Button that shows full description
                Button("Read More") {
                    isPresentingDescriptionView = true
                    
                }
                .sheet(isPresented: $isPresentingDescriptionView) {
                    NavigationView {
                        // passes the defined description variable to the detailDescription parameter of the detailsview to be displayed in a different format. Does not need $ binding the description is coming from the same source.
                        DetailsView(detailDescription: description)
                            .navigationTitle("Description")
                            .toolbar {
                                ToolbarItem(placement: .cancellationAction) {
                                    Button("Back") {
                                        isPresentingDescriptionView = false
                                    }
                                }
                            }
                    } // :NavigationView
                } // :sheet
            }
            .padding()
            .frame(minHeight: CardView.coverHeight + 54, alignment: .top)
        } // :HStack - Houses the entire card
        .background(.white)
        .opacity(0.9)
        .cornerRadius(20) // makes the background rounded. needs to match the RoundedRectangle in this configuration, since the borders overlap
        .overlay( // applies a rounded border
            RoundedRectangle(cornerRadius: 20)
                .stroke(.black, lineWidth: 1)
//                .shadow(radius: 20)
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
