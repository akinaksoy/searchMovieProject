//
//  ViewController.swift
//  searchMovieProject
//
//  Created by Akın Aksoy on 22.06.2022.
//

import UIKit
import SnapKit

class SearchViewController: BaseViewController {

    let viewModel = SearchViewModel()

    internal let searchController: UISearchController = {
        let controller = UISearchController(searchResultsController: SearchResultViewController())
        controller.searchBar.placeholder = "Search Movie or Tv Show"
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self])
            .defaultTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        controller.searchBar.searchBarStyle = .minimal
        return controller
    }()
    private let searchWarningImage = UIImageView.init(systemImageName: "magnifyingglass",
                                                      tintColor: UIColor.setContentColor)

    private let searchWarningLabel = UILabel.init(text: "Please Search Movie",
                                                  fontSize: 16,
                                                  textColor: UIColor.setContentColor)
    override func viewDidLoad() {
        super.viewDidLoad()
        searchController.searchResultsUpdater = self
        setup()
        configureNavigationBar()
    }

    override func configureNavigationBar() {
        super.configureNavigationBar()
        title = "Search"
        navigationItem.searchController = searchController
        searchController.searchBar.delegate = self
    }

    override func setup() {
        super.setup()
        view.addSubview(searchWarningImage)
        view.addSubview(searchWarningLabel)
        makeConstraintsDesign()
    }

    func makeConstraintsDesign() {
        searchWarningImage.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.height.width.equalTo(56)
        }
        searchWarningLabel.snp.makeConstraints { make in
            make.top.equalTo(searchWarningImage.snp_bottomMargin).offset(16)
            make.centerX.equalToSuperview()
        }
    }

}
