//
//  Alerts.swift
//  searchMovieProject
//
//  Created by Akın Aksoy on 25.06.2022.
//

import Foundation
import UIKit
struct Alerts {

    func getBasicAlert(title: String, message: String) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        return alert
    }

}
