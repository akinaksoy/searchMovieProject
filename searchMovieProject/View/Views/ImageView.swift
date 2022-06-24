//
//  ImageView.swift
//  searchMovieProject
//
//  Created by Akın Aksoy on 23.06.2022.
//

import Foundation
import UIKit

extension UIImageView {

    convenience init(systemImageName: String, tintColor: UIColor) {
        self.init()
        self.image = UIImage(systemName: systemImageName)
        self.tintColor = tintColor
        self.contentMode = .scaleAspectFit
    }
    convenience init(image: UIImage) {
        self.init()
        self.image = image
        self.contentMode = .scaleAspectFit
        self.layer.borderColor = UIColor.setCellHeaderLabelColor.cgColor
        self.layer.borderWidth = 2
    }

}
