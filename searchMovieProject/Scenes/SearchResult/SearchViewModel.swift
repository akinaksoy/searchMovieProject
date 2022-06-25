//
//  SearchViewModel.swift
//  searchMovieProject
//
//  Created by Akın Aksoy on 23.06.2022.
//

import Foundation
import UIKit
class SearchViewModel {

    var movieList: [Search] = [Search]()

    func prepareMovieListForTable(movieTitle: String?, completition : @escaping (Result<Bool, Error>) -> Void) {
        let manager = MovieAPIManager()

        guard let movieName = movieTitle else {return}
        manager.getAllMoviesWithName(movieName: movieName)
        manager.completionHandler {[weak self] movies, status, _ in
            if status {
                guard let movieResult = movies else {return}
                self?.movieList = movieResult.search
                completition(.success(true))
            } else {
                completition(.success(false))
            }
        }
    }
    func getMovieListCount() -> Int {
        movieList.count
    }
}
