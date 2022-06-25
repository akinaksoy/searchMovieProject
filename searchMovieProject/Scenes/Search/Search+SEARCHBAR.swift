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
        guard let movieName = searchController.searchBar.text else {return}
        let manager = MovieAPIManager()
        manager.getAllMoviesWithName(movieName: movieName)
        manager.completionHandler {[weak self] movies, status, message in
            if status {
                guard let movieResult = movies else {return}
                self?.searchResultPage?.searchResultList = movieResult.search
                self?.searchResultPage?.updateTable()
            } else {
                let alert = Alerts.init().getBasicAlert(title: "Something went wrong",
                                                        message: "Check your internet connection or movie name")
                self?.present(alert, animated: true, completion: nil)
            }
        }

        searchBar.resignFirstResponder() // hide keyboard
    }
}
