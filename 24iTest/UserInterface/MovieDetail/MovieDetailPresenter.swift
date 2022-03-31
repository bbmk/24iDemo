//
//  MovieDetailPresenter.swift
//  24iTest
//
//  Created by Bojan Angjeleski on 28.3.22.
//

import Foundation

protocol MovieDetailPresentationLogic {
    func presentSetup(response: MovieDetailModels.Response)
    func presentVideo(videoId: String)
}

class MovieDetailPresenter: MovieDetailPresentationLogic {

    weak var viewController: MovieDetailDisplayLogic?
    
    func presentSetup(response: MovieDetailModels.Response) {
        let genres = response.popularMovie.genres?.compactMap {$0.name}
            .reduce("", { $0 == "" ? $1 : $0 + "," + $1 })
        let viewModel = MovieDetailModels.ViewModel(model: .init(imageUrl: response.popularMovie.backdropPath ?? "",
                                                                 titleText: response.popularMovie.title ?? "",
                                                                 detailsText: response.popularMovie.overview ?? "",
                                                                 details2Text: genres ?? "", detail3Text: response.popularMovie.releaseDate ?? ""))
        viewController?.displaySetup(viewModel: viewModel)
    }
    
    func presentVideo(videoId: String) {
        viewController?.navigateToPlayerView(videoID: videoId)
    }
}
