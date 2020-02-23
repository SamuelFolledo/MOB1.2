//
//  FeaturedCell.swift
//  CompositionalCollection
//
//  Created by Adriana González Martínez on 2/12/20.
//  Copyright © 2020 Adriana González Martínez. All rights reserved.
//

import UIKit

class FeaturedCell: UICollectionViewCell {
    var image: UIImage = kMAKESCHOOLIMAGE {
        didSet {
            imgView.image = image
        }
    }
    static var identifier: String = "FeaturedCell"
    @IBOutlet weak var imgView: UIImageView!
    
//    required init(image: UIImage) { //allows to populate views from parameter
//        self.image = image
//        super.init(frame: .zero)
//        setup()
//    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }

    func setup(){
        imgView.backgroundColor = .red
        imgView.layer.cornerRadius = 10
        imgView.image = image
    }
}
