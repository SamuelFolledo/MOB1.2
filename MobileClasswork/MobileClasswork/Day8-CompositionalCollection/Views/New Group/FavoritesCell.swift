//
//  FavoritesCell.swift
//  CompositionalCollection
//
//  Created by Adriana González Martínez on 2/12/20.
//  Copyright © 2020 Adriana González Martínez. All rights reserved.
//

import UIKit

class FavoritesCell: UICollectionViewCell {
    var image: UIImage = kMIGRAINEIMAGE {
        didSet {
            imgView.image = image
        }
    }
    var name: String = "" {
        didSet {
            nameLabel.text = name
        }
    }
    static var identifier: String = "FavoritesCell"
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    func setup() {
        imgView.layer.cornerRadius = 10
        imgView.layer.borderWidth = 1.5
        self.contentView.layer.cornerRadius = 10
        self.contentView.layer.borderWidth = 1
    }
    
    func updateCellColors() {
        nameLabel.textColor = SettingsService.darkGrayColor
        imgView.backgroundColor = SettingsService.whiteColor
        imgView.layer.borderColor = SettingsService.darkGrayColor.cgColor
        contentView.layer.borderColor = SettingsService.darkGrayColor.cgColor
    }
}
