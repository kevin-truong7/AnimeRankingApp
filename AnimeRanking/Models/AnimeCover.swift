//
//  AnimeCover.swift
//  AnimeRanking
//
//  Created by Kevin Truong on 2023-06-22.
//

import SwiftUI
import Kingfisher

extension KFImage {
    func imageCover(width: CGFloat, height: CGFloat) -> some View {
        self
            .resizable()
            .scaledToFill()
            // orginal -> width: width, height: height
            .frame(width: 110, height: 200)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

struct AnimeCover: View {
    
    var imageUrl: String?
    // CGFloat sets the limits of x and y as a function of x and y in scalar values
    var width: CGFloat
    var height: CGFloat
    var cancelOnDisappear = false
    
    var body: some View {
        KFImage(URL(string: imageUrl ?? ""))
            .cancelOnDisappear(cancelOnDisappear)
            .imageCover(width: width, height: height)
    }
}

struct AnimeCover_Previews: PreviewProvider {
    static var previews: some View {
        AnimeCover(width: 73, height: 110)
            .previewLayout(.sizeThatFits)
    }
}


