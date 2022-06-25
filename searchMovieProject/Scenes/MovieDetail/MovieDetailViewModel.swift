//
//  MovieDetailViewModel.swift
//  searchMovieProject
//
//  Created by Akın Aksoy on 25.06.2022.
//

import Foundation

class MovieDetailViewModel {

    var movie: MovieDetail?

    func prepareMovieDetail(imdbID: String, completition : @escaping (Result<Bool, Error>) -> Void) {
        let manager = MovieDetailAPIManager()
        manager.getMovieWithImdb(imdbID: imdbID)
        manager.completionHandler {[weak self] movies, status, _ in
            if status {
                DispatchQueue.main.async {
                    guard let self = self else {return}
                    guard let movieResult = movies else {return}
                    self.movie = movieResult
                    completition(.success(true))
                }
            } else {
                completition(.success(false))
            }
        }
    }
}
