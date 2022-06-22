//
//  MovieAPIManager.swift
//  searchMovieProject
//
//  Created by Akın Aksoy on 22.06.2022.
//
import Foundation
import Alamofire

struct Constants {
    static let baseURL = "http://www.omdbapi.com/"
    static let APIKey = "apikey=ab0dda03"

    // https://www.omdbapi.com/?apikey=ab0dda03&s=IronMan
}

class MovieAPIManager {
    static let shared = MovieAPIManager()

    func getAllMoviesWithName(movieName: String, completition: @escaping (Result<Movie,Error>) -> Void) {
        let url = "\(Constants.baseURL)?\(Constants.APIKey)&s=\(movieName)"

        AF.request(url,
                   method: .get,
                   parameters: nil,
                   encoding: URLEncoding.default,
                   headers: nil,
                   interceptor: nil).response { (responseData) in
                    guard let data = responseData.data else {return}
                    do {
                        let movies = try JSONDecoder().decode(Movie.self, from: data)
                        completition(.success(movies))
                    } catch {
                        completition(.failure(error))
                        print(error.localizedDescription)
                    }
                   }
    }

}
