//
//  MovieDetailRouter.swift
//  24iTest
//
//  Created by Bojan Angjeleski on 28.3.22.
//

import Foundation

protocol MovieDetailRoutingLogic {
    func routeToPlayer(videoId: String)
}

protocol MovieDetailDataPassing {
    var dataStore: MovieDetailDataStore? { get set }
}

class MovieDetailRouter: MovieDetailDataPassing, MovieDetailRoutingLogic {
    weak var viewController: MovieDetailViewController?
    var dataStore: MovieDetailDataStore?
    
    func routeToPlayer(videoId: String) {
        let vc = PlayerViewController()
        vc.strYoutubeKey = videoId
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }
}
