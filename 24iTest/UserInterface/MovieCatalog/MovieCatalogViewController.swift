//
//  MovieCatalogViewController.swift
//  24iTest
//
//  Created by Bojan Angjeleski on 28.3.22.
//

import Foundation
import UIKit

protocol MovieCatalogDisplayLogic: AnyObject {
    func displaySetup(viewModel: MovieCatalogModels.ViewModel)
    func navigateToMovieDetails(action: MovieCatalogModels.Action)
}

class MovieCatalogViewController: UIViewController, MovieCatalogDisplayLogic {

    @IBOutlet weak var movieCatalogView: MovieCatalogView!
    private var interactor: MovieCatalogBusinessLogic?
    var router: (MovieCatalogDataPassing & MovieCatalogRoutingLogic)?
    
    init() {
        super.init(nibName: "MovieCatalogViewController", bundle: nil)
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
    }
    
    private func setup() {
        let interactor = MovieCatalogInteractor()
        let presenter = MovieCatalogPresenter()
        let router = MovieCatalogRouter()
        
        self.interactor = interactor
        self.router = router
        
        router.dataStore = interactor
        router.viewController = self
        interactor.presenter = presenter
        presenter.viewController = self
    }
    
    func displaySetup(viewModel: MovieCatalogModels.ViewModel) {
        movieCatalogView.set(model: viewModel.model)
        movieCatalogView.onSelectedIndex = { [weak self] selectedItem in
            self?.interactor?.handleSelection(item: selectedItem)
        }
    }
    func navigateToMovieDetails(action: MovieCatalogModels.Action) {
        self.router?.routeToMovieDetail(action: action)
    }
}
