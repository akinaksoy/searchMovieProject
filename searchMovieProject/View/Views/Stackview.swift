//
//  Stackview.swift
//  searchMovieProject
//
//  Created by Akın Aksoy on 24.06.2022.
//

import Foundation
import UIKit
extension UIStackView {

    convenience init(axis: NSLayoutConstraint.Axis,
                     distribution: UIStackView.Distribution,
                     allignment: UIStackView.Alignment) {
        self.init()
        
        self.axis = axis
        self.distribution = distribution
        self.alignment = allignment
    }

}
