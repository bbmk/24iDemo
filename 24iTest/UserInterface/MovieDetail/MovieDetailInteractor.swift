//
//  MovieDetailInteractor.swift
//  24iTest
//
//  Created by Bojan Angjeleski on 28.3.22.
//

import Foundation

protocol MovieDetailBusinessLogic {
    func performSetup(request: MovieDetailModels.Request)
    func handleSelection(item: Int)
}

protocol MovieDetailDataStore {
    var dataRepo: DataRepo? { get set }
    var movie: Results? { get set }
}

class MovieDetailInteractor: MovieDetailBusinessLogic, MovieDetailDataStore {
    var movie: Results?
    
    var dataRepo: DataRepo?
    
    var presenter: MovieDetailPresentationLogic?
    
    func performSetup(request: MovieDetailModels.Request) {
        //Curently we only pass popular movie since there are no relevant info from movieDetails call
        // otherwise this call needs to be made here
      
        if let movie = movie, let movieId = movie.id {
            dataRepo?.getMovieDetails(movieId: String(movieId), onComplete: {[weak self] movieDetails in
                self?.presenter?.presentSetup(response: .init(popularMovie: movieDetails))
            }, onError: { result in
                
            })
           
        }
    }
    
    func handleSelection(item: Int) {
        
    }
}
