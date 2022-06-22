//
//  Movie.swift
//  searchMovieProject
//
//  Created by Akın Aksoy on 22.06.2022.
//

import Foundation

// MARK: - Welcome
struct Movie: Decodable {
    let search: [Search]
    let totalResults, response: String

    enum CodingKeys: String, CodingKey {
        case search = "Search"
        case totalResults
        case response = "Response"
    }
}

// MARK: - Search
struct Search: Decodable {
    let title, year, imdbID: String
    let type: String
    let poster: String

    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case imdbID
        case type = "Type"
        case poster = "Poster"
    }
}

enum TypeEnum: String, Decodable {
    case movie = "movie"
    case series = "series"
}
