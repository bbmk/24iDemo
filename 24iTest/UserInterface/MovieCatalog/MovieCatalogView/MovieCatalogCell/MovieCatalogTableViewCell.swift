//
//  MovieCatalogTableViewCell.swift
//  24iTest
//
//  Created by Bojan Angjeleski on 29.3.22.
//

import UIKit

class MovieCatalogTableViewCell: UITableViewCell {
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var starsView: StarsView!
    @IBOutlet weak var downLeftLabel: UILabel!
    @IBOutlet weak var downRightLabel: UILabel!
    static let identifier: String = "MovieCatalogTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
