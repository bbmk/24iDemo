//
//  NetworkDataService.swift
//  24iTest
//
//  Created by Bojan Angjeleski on 29.3.22.
//

import Foundation

class NetworkDataService: DataService {

    func getPopularMovies(onComplete: @escaping (PopularMovies) -> Void, onError: @escaping ErrorCompletion) {
        NetworkService.request(router: NetworkRouter.getPopularMoviesList) {(popularMovies: PopularMovies) in
            encodeObject(object: popularMovies, path: "popularMovies")
            onComplete(popularMovies)
        } errorCompletion: { error in
            //TODO: Error handling
        }

    }
    
    func getMovieDetails(movieId: String, onComplete: @escaping (MovieDetails) -> Void, onError: @escaping ErrorCompletion) {
        NetworkService.request(router: NetworkRouter.getMovieDetails(movieId: movieId)) { (movieDetails: MovieDetails) in
            encodeObject(object: movieDetails, path: movieId)
            onComplete(movieDetails)
        } errorCompletion: { error in
    
        }
    }
    
    func getMovieVideos(movieId: String, onComplete: @escaping (MovieVideos) -> Void, onError: @escaping ErrorCompletion) {
        NetworkService.request(router: .getMovieVideos(movieId: movieId)) { (movieVideos: MovieVideos) in
            onComplete(movieVideos)
        } errorCompletion: { error in
            
        }

    }
}
