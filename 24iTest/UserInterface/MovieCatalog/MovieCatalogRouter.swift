//
//  MovieCatalogRouter.swift
//  24iTest
//
//  Created by Bojan Angjeleski on 28.3.22.
//

import Foundation

protocol MovieCatalogDataPassing {
    var dataStore: MovieCatalogDataStore? { get set }
}

class MovieCatalogRouter: MovieCatalogDataPassing {
    var dataStore: MovieCatalogDataStore?
}
