//
//  File.swift
//  searchMovieProject
//
//  Created by Akın Aksoy on 23.06.2022.
//

import Foundation
struct MovieService {
    static let shared = MovieService()
    let manager = MovieAPIManager()

    func getMovieList(movieName: String) -> [Search] {
        var movieList: [Search] = [Search]()
        manager.getAllMoviesWithName(movieName: movieName) { results in
            switch results {
            case .success(let movies) :
                movieList = movies.search
                print(movieList)
            case .failure(let error) :
                print(error.localizedDescription)
            }
        }
        return movieList
    }
}
