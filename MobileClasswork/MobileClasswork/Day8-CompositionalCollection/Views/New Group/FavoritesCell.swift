//
//  FavoritesCell.swift
//  CompositionalCollection
//
//  Created by Adriana González Martínez on 2/12/20.
//  Copyright © 2020 Adriana González Martínez. All rights reserved.
//

import UIKit

class FavoritesCell: UICollectionViewCell {
    static var identifier: String = "FavoritesCell"
    @IBOutlet weak var imgView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    func setup(){
        imgView.layer.cornerRadius = 10
    }
    
}
