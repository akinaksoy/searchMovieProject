//
//  Button.swift
//  searchMovieProject
//
//  Created by Akın Aksoy on 25.06.2022.
//

import Foundation
import UIKit
extension UIButton {

    convenience init(buttonText: String) {
        self.init()
        
        self.layer.borderWidth = 3
        self.layer.cornerRadius = 5
        self.layer.borderColor = UIColor.setButtonTitleLayerColor.cgColor
        self.setTitleColor(UIColor.setButtonTitleLayerColor, for: .normal)
        self.titleLabel?.font = .boldSystemFont(ofSize: 20)
        self.backgroundColor = .setButtonBackgroundColor
        self.layer.shadowColor = .init(red: 127, green: 132, blue: 135, alpha: 0.3)
        self.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.0
        self.layer.masksToBounds = false
        self.layer.cornerRadius = 4.0
        self.titleLabel?.numberOfLines = 0
        self.titleLabel?.textAlignment = .center
        self.setTitle(buttonText, for: .normal)
    }
}
