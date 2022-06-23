//
//  SearchViewModel.swift
//  searchMovieProject
//
//  Created by Akın Aksoy on 23.06.2022.
//

import Foundation
class SearchViewModel {

    func getMovieList(movieName: String) -> [Search] {
        var movieList: [Search] = [Search]()
        MovieAPIManager.shared.getAllMoviesWithName(movieName: movieName) { results in
            switch results {
            case .success(let movies) :
                movieList = movies.search
            case .failure(let error) :
                print(error.localizedDescription)
            }
        }
        return movieList
    }

}
