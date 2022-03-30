//
//  NetworkDataService.swift
//  24iTest
//
//  Created by Bojan Angjeleski on 29.3.22.
//

import Foundation

struct NetworkDataService: DataService {
    func getPopularMovies(onComplete: @escaping (PopularMovies) -> Void, onError: @escaping ErrorCompletion) {
        NetworkService.request(router: NetworkRouter.getPopularMoviesList) {(popularMovies: PopularMovies) in
            onComplete(popularMovies)
        } errorCompletion: { error in
            
        }

    }
    
    func getMovieDetails(movieId: String, onComplete: @escaping (MovieDetails) -> Void, onError: @escaping ErrorCompletion) {
        NetworkService.request(router: NetworkRouter.getMovieDetails(movieId: movieId)) { (movieDetails: MovieDetails) in
            onComplete(movieDetails)
        } errorCompletion: { error in
    
        }
    }
}
