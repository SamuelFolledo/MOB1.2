//
//  TitleCell.swift
//  MobileClasswork
//
//  Created by Macbook Pro 15 on 2/15/20.
//  Copyright © 2020 SamuelFolledo. All rights reserved.
//

import UIKit


class TitleCell: UICollectionViewCell {
    static var identifier: String = "TitleCell"
    @IBOutlet private var lblTitle: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func set(title: String) {
        lblTitle.text = title
        lblTitle.textColor = SettingsService.darkGrayColor
    }
}
