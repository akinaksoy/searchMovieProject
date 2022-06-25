//
//  MovieDetailManager.swift
//  searchMovieProject
//
//  Created by Akın Aksoy on 24.06.2022.
//

import Foundation
import Alamofire

// https://www.omdbapi.com/?apikey=ab0dda03&i=tt1569923

class MovieDetailAPIManager {
    static let shared = MovieDetailAPIManager()
    typealias MovieCallBack = (_ movies: MovieDetail?, _ status: Bool, _ message: String) -> Void
    var callBack: MovieCallBack?
    
    func getMovieWithImdb(imdbID: String) {
        let url = "\(Constants.baseURL)?\(Constants.APIKey)&i=\(imdbID)"
        
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
                        let movie = try JSONDecoder().decode(MovieDetail.self, from: data)
                        self.callBack?(movie, true, "")
                    } catch {
                        self.callBack?(nil, false, "")
                        print(error.localizedDescription)
                    }
                   }
    }
    
    func completionHandler(callBack: @escaping MovieCallBack) {
        self.callBack = callBack
    }
}
