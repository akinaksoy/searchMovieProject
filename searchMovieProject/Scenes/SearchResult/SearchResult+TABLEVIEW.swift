//
//  SearchResult+TABLEVIEW.swift
//  searchMovieProject
//
//  Created by Akın Aksoy on 24.06.2022.
//

import Foundation
import UIKit
extension SearchResultViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getMovieListCount()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SearchResultTableViewCell.identifier, for: indexPath) as? SearchResultTableViewCell else {
            return UITableViewCell()
        }
        cell.heroID = "\(indexPath.row)"
        let searchModel = viewModel.movieList[indexPath.row]
        cell.configure(model: searchModel)
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120

    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? SearchResultTableViewCell else {return}
        cell.heroID = "\(indexPath.row)"
        let destinationVC = MovieDetailViewController()
        let imdbID = viewModel.movieList[indexPath.row].imdbID
        destinationVC.imdbId = imdbID
        destinationVC.movieImage.heroID = "\(indexPath.row)"
        self.showHero(destinationVC)
    }

}
