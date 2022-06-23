//
//  BaseViewController.swift
//  searchMovieProject
//
//  Created by Akın Aksoy on 23.06.2022.
//

import UIKit
import SnapKit
class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    func setup() {
        view.backgroundColor = UIColor.setBackgroundColor

    }

    func configureNavigationBar() {
        let appearance = UINavigationBarAppearance()
        navigationController?.navigationBar.tintColor = .white
        appearance.titleTextAttributes = [.foregroundColor: UIColor.setTitleColor]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.setTitleColor]
        appearance.backgroundColor = UIColor.setNavigationColor
        navigationItem.standardAppearance = appearance
        navigationItem.scrollEdgeAppearance = appearance
    }

}
