//
//  MovieCatalogView.swift
//  24iTest
//
//  Created by Bojan Angjeleski on 29.3.22.
//

import UIKit
import Foundation

class MovieCatalogView: SHNibDesignableView {
    struct Appearance {
        let title: String
        let downLeftText: String
        let downRightText: String
        let image: String
        let ratings: Double
    }
    
    struct Model {
        let items: [Appearance]
        
        init?(items: [Appearance]) {
            self.items = items
        }
        
        fileprivate init() {
            items = []
        }
    }
    
    struct Callbacks {
        let onIndexSelected: ((Int) -> Void)?
    }
    
    @IBOutlet weak var tableView: UITableView?
    
    private var callbacks: Callbacks?
    var onSelectedIndex: ((Int) -> Void)?
    private var model: Model = .init()
    let imageLoader = ImageLoader()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        viewDidLoadFromNib()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoadFromNib() {
        
        self.backgroundColor = .clear
        self.tableView?.backgroundColor = .gray
        
        self.tableView?.register(UINib(nibName: MovieCatalogTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: MovieCatalogTableViewCell.identifier)
        self.tableView?.delegate = self
        self.tableView?.dataSource = self
        self.tableView?.reloadData()
    }
    
    func set(model: Model) {
        self.model = model
        self.tableView?.reloadData()
    }
}

extension MovieCatalogView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.model.items.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MovieCatalogTableViewCell.identifier, for: indexPath) as? MovieCatalogTableViewCell else {
            return UITableViewCell()
        }
        
        let item = model.items[indexPath.row]
        cell.titleLabel.text = item.title
        cell.starsView.rating = item.ratings
        cell.downLeftLabel.text = item.downLeftText
        cell.downRightLabel.text = item.downRightText
        imageLoader.obtainImageWithPath(imagePath: item.image) { (image) in
            if let _ = tableView.cellForRow(at: indexPath) {
                cell.posterImageView.image = image
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.onSelectedIndex?(indexPath.row)
    }
}