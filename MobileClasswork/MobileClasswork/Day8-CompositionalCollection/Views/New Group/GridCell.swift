//
//  GridCell.swift
//  CompositionalCollection
//
//  Created by Adriana González Martínez on 2/12/20.
//  Copyright © 2020 Adriana González Martínez. All rights reserved.
//

import UIKit

class GridCell: UICollectionViewCell {
    static var identifier: String = "GridCell"
    @IBOutlet weak var mainView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
        
    }
    func setup() {
        mainView.layer.cornerRadius = 10.0
    }
}
