//
//  CollectionViewCell.swift
//  MobileClasswork
//
//  Created by Macbook Pro 15 on 1/31/20.
//  Copyright © 2020 SamuelFolledo. All rights reserved.
//

import UIKit

//@IBDesignable //allow us to use this view in designing storyboard
//@IBInspectable var cornerRadius: CGFloat = 0.0
class CollectionViewCell: UICollectionViewCell {
//MARK: Properties
    var data: [String: Int] = ["Kobe":24]
    
//MARK: IBOutlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setupView() {
        titleLabel.text = "TESTING"
        descriptionLabel.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
    }
    
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes { //this is to have a dynamic height on cell
        setNeedsLayout()
        layoutIfNeeded()
        let size = contentView.systemLayoutSizeFitting(layoutAttributes.size)
        var frame = layoutAttributes.frame
        frame.size.height = ceil(size.height)
        layoutAttributes.frame = frame
        return layoutAttributes
    }
}
