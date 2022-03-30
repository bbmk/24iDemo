//
//  MovieDetailModels.swift
//  24iTest
//
//  Created by Bojan Angjeleski on 30.3.22.
//

import Foundation

enum MovieDetailModels {
    struct ViewModel {
        let model: MovieDetailView.Model
    }
    
    struct Request {
      //  let popularMovie: Results
    }
    
    struct Response {
        let popularMovie: MovieDetails
    }
}
