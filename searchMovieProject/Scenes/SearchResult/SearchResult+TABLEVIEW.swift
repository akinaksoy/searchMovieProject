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
        return searchResultList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SearchResultTableViewCell.identifier, for: indexPath) as? SearchResultTableViewCell else {
            return UITableViewCell()
        }
        let searchModel = searchResultList[indexPath.row]
        cell.configure(model: searchModel)
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120

    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let manager = MovieDetailAPIManager()
        let imdbID = searchResultList[indexPath.row].imdbID
        manager.getMovieWithImdb(imdbID: imdbID)
        manager.completionHandler {[weak self] movies, status, message in
            if status {
                DispatchQueue.main.async {
                    guard let self = self else {return}
                    guard let movieResult = movies else {return}
                    // self.searchResultdelegate?.searchResultsViewControllerDidTapItem(movieResult)
                    let destinationVC = MovieDetailViewController()
                    destinationVC.configure(model: movieResult)
                    self.presentingViewController?.navigationController?
                        .pushViewController(destinationVC, animated: true)
                }
            } else {
                let alert = Alerts.init().getBasicAlert(title: message,
                                                        message: "Check your internet connection")
                self?.present(alert, animated: true, completion: nil)
            }
        }
    }

}
