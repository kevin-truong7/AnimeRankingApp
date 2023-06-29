//
//  CardView.swift
//  AnimeRanking
//
//  Created by Kevin Truong on 2023-06-22.
//

import SwiftUI
import RichText

struct CardView: View {
    static let coverWidth: CGFloat = 90
    static let coverHeight: CGFloat = 130
    
    var title: String
    var imageUrl: String?
    var meanScore: Int?
    var description: String
    var genre: [String?]
    
    @State private var isPresentingDescriptionView = false
    
    var body: some View {
        // information displayed and laid out in cardview
        HStack {
            VStack{
                AnimeCover(imageUrl: imageUrl, width: CardView.coverWidth, height: CardView.coverHeight, cancelOnDisappear: true)
    //                .padding(1)
            }
            .padding(.leading, 10)
            VStack(alignment: .leading) {
                Text(title)
                    /// need to include alignment in frame for it to work properly
                    .frame(maxWidth: 170, alignment: .leading)
                    .font(.system(size: 20))
                    .lineLimit(5)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.primary)
                    .bold()
                
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
                }
                
                /// Genres
                /// The ! is used to abort operation if the value of optional is nil. The ?? is used to provide a default value if the operational is nil
                Group {
                    Text("Genre:")
                        .bold()
                        .padding(.top, 1)
                    ForEach(genre.indices) {
                        Text(self.genre[$0] ?? "")
                    }
                }
                
//                Text(description)
//                    .lineLimit(3)
                
/// RichText looks nicer, but need to figure how to limit lines
//                RichText(html: description)
//                    .lineLimit(5)
//                    .DescStyle()
//                    .multilineTextAlignment(.leading)
                
                // Button that shows full description
                Button("Read Description") {
                    isPresentingDescriptionView = true
                }
                .padding(.top, 1)
                .sheet(isPresented: $isPresentingDescriptionView) {
                    NavigationView {
                        // passes the defined description variable to the detailDescription parameter of the detailsview to be displayed in a different format. Does not need $ binding the description is coming from the same source.
                        DetailsView(detailDescription: description, detailTitle: title)
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
            } // :VStack
            .padding()
            .frame(minHeight: CardView.coverHeight + 54, alignment: .top)
        } // :HStack - Houses the entire card
        .padding([.bottom, .top], 10)
        .frame(minWidth: 340, maxWidth: 340)
        .background(.white)
        .opacity(0.9)
        .cornerRadius(20) // makes the background rounded. needs to match the RoundedRectangle in this configuration, since the borders overlap
        .overlay( // applies a rounded border
            RoundedRectangle(cornerRadius: 20)
                .stroke(.black, lineWidth: 1)
//                .shadow(radius: 20)
        )
    } // :Body View
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        LazyHStack(alignment: .top) {
            CardView(title: "Kimetsu no Yaiba: Katana", imageUrl: "", meanScore: 78, description: "this anime...", genre: [""])
                .previewLayout(.sizeThatFits)
//            CardView(title: "One Piece", imageUrl: "")
//                .previewLayout(.sizeThatFits)
        }
    }
}
