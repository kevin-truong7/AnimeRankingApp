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
            .frame(width: width, height: height)
            .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

struct AnimeCover: View {
    
    var imageUrl: String?
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


