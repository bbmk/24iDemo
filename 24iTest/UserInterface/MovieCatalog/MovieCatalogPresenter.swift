//
//  MovieCatalogPresenter.swift
//  24iTest
//
//  Created by Bojan Angjeleski on 28.3.22.
//

import Foundation

protocol MovieCatalogPresentationLogic {
    func presentSetup(response: MovieCatalogModels.Response)
    func presentMovieCatalog(action: MovieCatalogModels.Action)
}

class MovieCatalogPresenter: MovieCatalogPresentationLogic {

    weak var viewController: MovieCatalogDisplayLogic?
    func presentSetup(response: MovieCatalogModels.Response) {
        print(response)
        let items = response.popularMovies.compactMap { MovieCatalogView.Appearance(title: $0.title ?? ""
                                                                                   , downLeftText: $0.releaseDate ?? "",
                                                                                   downRightText: $0.originalLanguage ?? "", image: $0.posterPath ?? "",
                                                                                   ratings:Double(($0.voteAverage ?? 0.0) / 2))}
        let model = MovieCatalogView.Model(items: items)
        viewController?.displaySetup(viewModel: .init(model: model!))
    }
    func presentMovieCatalog(action: MovieCatalogModels.Action) {
        viewController?.navigateToMovieDetails(action: action)
    }
}
