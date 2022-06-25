//
//  Search+SEARCHBAR.swift
//  searchMovieProject
//
//  Created by Akın Aksoy on 24.06.2022.
//

import Foundation
import UIKit

extension SearchViewController: UISearchBarDelegate, UISearchResultsUpdating {

    func updateSearchResults(for searchController: UISearchController) {

        searchResultPage?.searchBar = searchController.searchBar
        searchResultPage?.setEnableSearchButton()
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchResultPage?.designTable()
        searchResultPage?.prepareMovieListForTable()

        searchBar.resignFirstResponder() // hide keyboard
    }
}
