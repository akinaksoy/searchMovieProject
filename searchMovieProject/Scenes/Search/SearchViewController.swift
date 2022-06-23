//
//  ViewController.swift
//  searchMovieProject
//
//  Created by Akın Aksoy on 22.06.2022.
//

import UIKit
import SnapKit
class SearchViewController: UIViewController, UISearchResultsUpdating {

    let viewModel = SearchViewModel()

    private let searchController: UISearchController = {
        let controller = UISearchController(searchResultsController: SearchResultViewController())
        controller.searchBar.placeholder = "Search Movie or Tv Show"
        controller.searchBar.searchBarStyle = .minimal
        return controller
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        title = "Search"
        navigationItem.searchController = searchController
        searchController.searchResultsUpdater = self
        navigationController?.navigationBar.tintColor = .white
    }

    override func viewDidAppear(_ animated: Bool) {

    }
    func updateSearchResults(for searchController: UISearchController) {
        guard let movieText = searchController.searchBar.text else {
            return
        }
        print(movieText)
    }
}
