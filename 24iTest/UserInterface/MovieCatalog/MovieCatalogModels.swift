//
//  MovieCatalogModels.swift
//  24iTest
//
//  Created by Bojan Angjeleski on 29.3.22.
//

import UIKit

enum MovieCatalogModels {
    struct ViewModel {
        let model: MovieCatalogView.Model
    }
    
    struct Request {
    }
    
    struct Response {
        let popularMovies: [Results]
    }
    
    struct Action {
        let popularMovie: Results
    }
}
