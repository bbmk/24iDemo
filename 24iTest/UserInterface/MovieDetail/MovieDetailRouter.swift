//
//  MovieDetailRouter.swift
//  24iTest
//
//  Created by Bojan Angjeleski on 28.3.22.
//

import Foundation

protocol MovieDetailDataPassing {
    var dataStore: MovieDetailDataStore? { get set }
}

class MovieDetailRouter: MovieDetailDataPassing {
    var dataStore: MovieDetailDataStore?
}
