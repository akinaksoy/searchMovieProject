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
    typealias MoviesCallBack = (_ movies: Movie?, _ status: Bool, _ message: String) -> Void
    var callBack: MoviesCallBack?
    func getAllMoviesWithName(movieName: String) {
        let url = "\(Constants.baseURL)?\(Constants.APIKey)&s=\(movieName)"
        AF.request(url,
                   method: .get,
                   parameters: nil,
                   encoding: URLEncoding.default,
                   headers: nil,
                   interceptor: nil).response { (responseData) in
                    guard let data = responseData.data else {
                        self.callBack?(nil, false, "")
                        return}
                    do {
                        let movies = try JSONDecoder().decode(Movie.self, from: data)
                        self.callBack?(movies, true, "")
                    } catch {
                        self.callBack?(nil, false, "")
                        print(error.localizedDescription)
                    }
                   }
    }
    func completionHandler(callBack: @escaping MoviesCallBack) {
        self.callBack = callBack
    }
}
