//
//  MovieDetailViewController.swift
//  24iTest
//
//  Created by Bojan Angjeleski on 28.3.22.
//

import Foundation
import UIKit

protocol MovieDetailDisplayLogic: AnyObject {
    func displaySetup(viewModel: MovieDetailModels.ViewModel)
    func navigateToPlayerView(videoID: String)
}

class MovieDetailViewController: UIViewController, MovieDetailDisplayLogic {

    @IBOutlet weak var movieDetailView: MovieDetailView!
    private var interactor: MovieDetailBusinessLogic?
    var router: (MovieDetailDataPassing & MovieDetailRoutingLogic)?
    
    init() {
        super.init(nibName: "MovieDetailViewController", bundle: nil)
        setup()
       
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .gray
        interactor?.performSetup(request: .init())
        self.title = "Movie Details" // need to be localized
    }
    
    private func setup() {
        let interactor = MovieDetailInteractor()
        let presenter = MovieDetailPresenter()
        let router = MovieDetailRouter()
        
        self.interactor = interactor
        self.router = router
        router.viewController = self
        
        router.dataStore = interactor
        interactor.presenter = presenter
        presenter.viewController = self
    }
    
    func displaySetup(viewModel: MovieDetailModels.ViewModel) {
        movieDetailView.set(model: viewModel.model)
        movieDetailView.onSelectedIndex = {
            self.interactor?.handleSelection()
        }
    }
    
    func navigateToPlayerView(videoID: String) {
        router?.routeToPlayer(videoId: videoID)
    }
}
