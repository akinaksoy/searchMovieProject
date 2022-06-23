//
//  ColorExtension.swift
//  searchMovieProject
//
//  Created by Akın Aksoy on 22.06.2022.
//

import Foundation
import UIKit
extension UIColor {

    static var setTitleColor: UIColor {
        if let color = UIColor(named: "White-1") {
            return color
        } else {
            return .white
        }
    }
    static var setContentColor: UIColor {
        if let color = UIColor(named: "Blue-1") {
            return color
        } else {
            return .white
        }
    }
    static var setBackgroundColor: UIColor {
        if let color = UIColor(named: "White-2") {
            return color
        } else {
            return .white
        }
    }
    static var setNavigationColor: UIColor {
        if let color = UIColor(named: "Blue-2") {
            return color
        } else {
            return .blue
        }
    }
    static var setButtonBackgroundColor: UIColor {
        if let color = UIColor(named: "Blue-1") {
            return color
        } else {
            return .blue
        }
    }
    static  var setButtonTitleLayerColor: UIColor {
        if let color = UIColor(named: "Orange-1") {
            return color
        } else {
            return .orange
        }
    }
    static var setCellBackgroundColor: UIColor {
        if let color = UIColor(named: "Blue-1") {
            return color
        } else {
            return .blue
        }
    }
    static var setCellHeaderLabelColor: UIColor {
        if let color = UIColor(named: "Orange-1") {
            return color
        } else {
            return .orange
        }
    }
    static var setCellContentLabelColor: UIColor {
        if let color = UIColor(named: "White-1") {
            return color
        } else {
            return .white
        }
    }
}
