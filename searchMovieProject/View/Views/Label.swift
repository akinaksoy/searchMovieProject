//
//  Label.swift
//  searchMovieProject
//
//  Created by Akın Aksoy on 22.06.2022.
//

import Foundation
import UIKit

extension UILabel {

    convenience init(text: String, fontSize: CGFloat) {
        self.init()
        self.text = text
        self.font = .boldSystemFont(ofSize: fontSize)
    }

}
