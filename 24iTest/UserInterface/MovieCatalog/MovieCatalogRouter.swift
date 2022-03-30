//
//  MovieCatalogRouter.swift
//  24iTest
//
//  Created by Bojan Angjeleski on 28.3.22.
//

import Foundation

protocol MovieCatalogRoutingLogic {
    func routeToMovieDetail(action: MovieCatalogModels.Action)
}

protocol MovieCatalogDataPassing {
    var dataStore: MovieCatalogDataStore? { get set }
}

class MovieCatalogRouter: MovieCatalogDataPassing, MovieCatalogRoutingLogic {
    weak var viewController: MovieCatalogViewController?
    func routeToMovieDetail(action: MovieCatalogModels.Action) {
     let vc = MovieDetailViewController()
        vc.router?.dataStore?.movie = action.popularMovie
        vc.router?.dataStore?.dataRepo = dataStore?.dataRepo
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }
    
    var dataStore: MovieCatalogDataStore?
}
