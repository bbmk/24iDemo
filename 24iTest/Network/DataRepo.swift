//
//  DataRepo.swift
//  24iTest
//
//  Created by Bojan Angjeleski on 29.3.22.
//

import Foundation
typealias ErrorCompletion = (_ result: Error) -> Void
protocol DataService {
     func getPopularMovies(onComplete:@escaping(_ result: PopularMovies) -> Void,onError:@escaping ErrorCompletion)
     func getMovieDetails(movieId:String,onComplete:@escaping(_ result: MovieDetails) -> Void,onError:@escaping ErrorCompletion)
     func getMovieVideos(movieId:String,onComplete:@escaping(_ result: MovieVideos) -> Void,onError:@escaping ErrorCompletion)
}

class DataRepo: DataService {

    
    var networkData: DataService
    var chashedData: DataService
    
    init(networkData: DataService, chashedData: DataService) {
        self.networkData = networkData
        self.chashedData = chashedData
    }
    func getPopularMovies(onComplete: @escaping (PopularMovies) -> Void, onError: @escaping ErrorCompletion) {
        if Reachability.isConnectedToNetwork() {
            networkData.getPopularMovies(onComplete: onComplete, onError: onError)
        }else {
            chashedData.getPopularMovies(onComplete: onComplete, onError: onError)
        }
    }
    
    func getMovieDetails(movieId: String, onComplete: @escaping (MovieDetails) -> Void, onError: @escaping ErrorCompletion) {
        if Reachability.isConnectedToNetwork() {
            networkData.getMovieDetails(movieId: movieId, onComplete: onComplete, onError: onError)
        } else {
            chashedData.getMovieDetails(movieId: movieId, onComplete: onComplete, onError: onError)
        }
        
    }
    
    func getMovieVideos(movieId: String, onComplete: @escaping (MovieVideos) -> Void, onError: @escaping ErrorCompletion) {
        if Reachability.isConnectedToNetwork() {
            networkData.getMovieVideos(movieId: movieId, onComplete: onComplete, onError: onError)
        } else {
           // chashedData.getMovieDetails(movieId: movieId, onComplete: onComplete, onError: onError)
        }
    }
}
