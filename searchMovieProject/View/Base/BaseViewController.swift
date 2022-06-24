//
//  BaseViewController.swift
//  searchMovieProject
//
//  Created by Akın Aksoy on 23.06.2022.
//

import UIKit
import SnapKit
import Hero
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

    func disableHero() {
        navigationController?.hero.isEnabled = false
    }
    func enableHero() {
        hero.isEnabled = true
        navigationController?.hero.isEnabled = true
    }
    func showHero(_ viewController: UIViewController,
                  navigationAnimationType: HeroDefaultAnimationType =
                    .zoomSlide(direction: .leading)) {
        viewController.hero.isEnabled = true
        presentingViewController?.navigationController?.hero.isEnabled = true
        presentingViewController?.navigationController?.hero.navigationAnimationType = navigationAnimationType
        self.presentingViewController?.navigationController?
            .pushViewController(viewController, animated: true)
    }

}
