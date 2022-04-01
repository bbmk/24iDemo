//
//  MovieDetailView.swift
//  24iTest
//
//  Created by Bojan Angjeleski on 30.3.22.
//

import UIKit

class MovieDetailView: SHNibDesignableView {
    struct Model {
        let imageUrl: String
        let titleText: String
        let detailsText: String
        let details2Text: String
        let detail3Text: String
    }
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailsLabel: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var details2Label: UILabel!
    @IBOutlet weak var details3Label: UILabel!
    @IBOutlet weak var button: UIButton!
    
    private var model: Model?
    private let imageLoader = ImageLoader()
    var onSelectedIndex: (() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        viewDidLoadFromNib()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoadFromNib() {
        self.backgroundColor = .gray
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.systemYellow.cgColor
//        scrollView.contentSize = CGSize(width: self.frame.size.width, height: 600)

    }
    
    func set(model: Model) {
        titleLabel.text = model.titleText
        detailsLabel.text = model.detailsText
        details2Label.text = model.details2Text
        details3Label.text = model.detail3Text
     //   details4Label.text = model.details4Text
        imageLoader.obtainImageWithPath(imagePath: model.imageUrl) { [weak self] (image) in
            self?.imageView.image = image
        }
        
    }
    @IBAction func watchTrailerAction(_ sender: Any) {
        onSelectedIndex?()
    }
}
