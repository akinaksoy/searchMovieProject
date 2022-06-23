//
//  SearchViewModel.swift
//  searchMovieProject
//
//  Created by Akın Aksoy on 23.06.2022.
//

import Foundation
class SearchViewModel {
    var movieList: [Search] = [Search]()

    func getMovieList(movieName: String) {

        movieList = MovieService.shared.getMovieList(movieName: movieName)
    }

}
