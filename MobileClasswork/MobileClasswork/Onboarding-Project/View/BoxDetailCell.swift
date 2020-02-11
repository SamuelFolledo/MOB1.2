//
//  BoxDetailCell.swift
//  MobileClasswork
//
//  Created by Macbook Pro 15 on 2/11/20.
//  Copyright © 2020 SamuelFolledo. All rights reserved.
//

import UIKit

class BoxDetailCell: UITableViewCell {
    
    let background : UIView = {
        let background = UIView()
        background.translatesAutoresizingMaskIntoConstraints = false
        background.backgroundColor = #colorLiteral(red: 0.8186396956, green: 0.7955000997, blue: 1, alpha: 1)
        background.layer.cornerRadius = 5
        background.layer.masksToBounds = true
        return background
    }()
    let boxImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 5
        imageView.layer.masksToBounds = true
        imageView.image = kMAKESCHOOLIMAGE
        return imageView
    }()
    let boxLabel: UILabel = {
        let label: UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.sizeToFit()
        label.numberOfLines = 0
        label.textColor = .white
        label.textAlignment = .left
        label.text = "Box"
        return label
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    //initializer for a cell
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }
    
    func setup() {
        self.contentView.addSubview(background)
        background.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10).isActive = true
        background.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor).isActive = true
        background.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor).isActive = true
        background.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor).isActive = true
        background.addSubview(boxImageView)
        boxImageView.centerYAnchor.constraint(equalTo: background.centerYAnchor).isActive = true
        boxImageView.leadingAnchor.constraint(equalTo: background.leadingAnchor, constant: 10).isActive = true
        boxImageView.heightAnchor.constraint(equalTo: background.heightAnchor, multiplier: 0.8).isActive = true
        boxImageView.widthAnchor.constraint(equalTo: boxImageView.heightAnchor).isActive = true
        background.addSubview(boxLabel)
        boxLabel.centerYAnchor.constraint(equalTo: boxImageView.centerYAnchor).isActive = true
        boxLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor).isActive = true
        boxLabel.leadingAnchor.constraint(equalTo: boxImageView.trailingAnchor, constant: 10).isActive = true
        boxLabel.trailingAnchor.constraint(equalTo: background.trailingAnchor, constant: 10).isActive = true
    }
}

