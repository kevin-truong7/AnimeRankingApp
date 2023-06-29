//
//  ExtraFunctionality.swift
//  AnimeRanking
//
//  Created by Kevin Truong on 2023-06-28.
//

import Foundation
import SwiftUI
import RichText


// extension allows for RichText customization
extension RichText {
    func DescStyle() -> RichText {
        self
            // this is the default, and is a placeholder to show it is customized
            .lineHeight(170)
    }
}
