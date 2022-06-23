//
//  ViewController.swift
//  searchMovieProject
//
//  Created by Akın Aksoy on 22.06.2022.
//

import UIKit
import SnapKit

class SearchViewController: BaseViewController, UISearchResultsUpdating {

    let viewModel = SearchViewModel()

    private let searchController: UISearchController = {
        let controller = UISearchController(searchResultsController: SearchResultViewController())
        controller.searchBar.placeholder = "Search Movie or Tv Show"
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self])
            .defaultTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        controller.searchBar.searchBarStyle = .minimal
        return controller
    }()
    private let searchWarningImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "magnifyingglass")
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = UIColor.setContentColor
        return imageView
    }()
    private let searchWarningLabel = UILabel.init(text: "Please Search Movie",
                                                  fontSize: 16,
                                                  textColor: UIColor.setContentColor)
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        configureNavigationBar()
    }

    override func configureNavigationBar() {
        super.configureNavigationBar()
        title = "Search"
        navigationItem.searchController = searchController
        searchController.searchResultsUpdater = self
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

    func updateSearchResults(for searchController: UISearchController) {
        guard let movieText = searchController.searchBar.text else {
            return
        }
        print(movieText)
    }
}
