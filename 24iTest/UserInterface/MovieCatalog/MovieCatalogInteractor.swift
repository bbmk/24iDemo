//
//  MovieCatalogInteractor.swift
//  24iTest
//
//  Created by Bojan Angjeleski on 28.3.22.
//

import Foundation

protocol MovieCatalogBusinessLogic {
    func performSetup(request: MovieCatalogModels.Request)
    func handleSelection(item: Int)
}

protocol MovieCatalogDataStore {
    var dataRepo: DataRepo? { get set }
}

class MovieCatalogInteractor: MovieCatalogBusinessLogic, MovieCatalogDataStore {
    var dataRepo: DataRepo?
    var popularMovies: PopularMovies?
    
    var presenter: MovieCatalogPresentationLogic?
    
    func performSetup(request: MovieCatalogModels.Request) {
        self.dataRepo?.getPopularMovies(onComplete: {[weak self] movies in
            if let results = movies.results {
                self?.popularMovies = movies
                self?.presenter?.presentSetup(response: .init(popularMovies: results))
            }
        }, onError: { result in
            //TODO: Error handling
        })
    }
    
    func handleSelection(item: Int) {
        if let movie = popularMovies?.results?[item] {
            presenter?.presentMovieCatalog(action: .init(popularMovie: movie))
        }
    }
}
