//
//  CashedDataService.swift
//  24iTest
//
//  Created by Bojan Angjeleski on 30.3.22.
//

import Foundation
import UIKit

class CashedDataService: DataService {
    
    func getPopularMovies(onComplete: @escaping (PopularMovies) -> Void, onError: @escaping ErrorCompletion) {
        if let popularMovie = decodeObject(object: PopularMovies.self, path: "popularMovies") {
            onComplete(popularMovie)
        }
        
        //TODO: Error Handling
    }
    func getMovieDetails(movieId: String, onComplete: @escaping (MovieDetails) -> Void, onError: @escaping ErrorCompletion) {
        if let movieDetails = decodeObject(object: MovieDetails.self, path: movieId) {
            onComplete(movieDetails)
        }
    }
}
