//
//  MovieCatalogInteractor.swift
//  24iTest
//
//  Created by Bojan Angjeleski on 28.3.22.
//

import Foundation

protocol MovieCatalogBusinessLogic {
    func performSetup(request: MovieCatalogModels.Request)
}

protocol MovieCatalogDataStore {
    var dataRepo: DataRepo? { get set }
}

class MovieCatalogInteractor: MovieCatalogBusinessLogic, MovieCatalogDataStore {
    var dataRepo: DataRepo?
    
    var presenter: MovieCatalogPresentationLogic?
    
    func performSetup(request: MovieCatalogModels.Request) {
        self.dataRepo?.getPopularMovies(onComplete: {[weak self] movies in
            if let results = movies.results {
                self?.presenter?.presentSetup(response: .init(popularMovies: results))
            }
        }, onError: { result in
            //TODO: Error handling
        })
    }
}
