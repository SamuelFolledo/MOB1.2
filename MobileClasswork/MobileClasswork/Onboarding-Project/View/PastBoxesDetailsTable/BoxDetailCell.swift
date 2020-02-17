//
//  BoxDetailCell.swift
//  MobileClasswork
//
//  Created by Macbook Pro 15 on 2/11/20.
//  Copyright © 2020 SamuelFolledo. All rights reserved.
//

import UIKit

class BoxDetailCell: UITableViewCell {
    static let identifier: String = "BoxDetailCell"
    var isFavorite: Bool = false
    
    let background : UIView = {
        let background = UIView()
        background.translatesAutoresizingMaskIntoConstraints = false
        background.backgroundColor = kMAINCOLOR
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
    let labelStackView: UIStackView = {
        let stackView: UIStackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        return stackView
    }()
    let titleLabel: UILabel = {
        let label: UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textColor = .black
        label.sizeToFit()
        label.numberOfLines = 0
        label.textColor = .black
        label.textAlignment = .left
        label.text = "Title"
        return label
    }()
    let descriptionLabel: UILabel = {
        let label: UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .lightGray
        label.sizeToFit()
        label.numberOfLines = 0
        label.textColor = .gray
        label.textAlignment = .left
        label.text = "Description"
        return label
    }()
    let starImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 5
        imageView.layer.masksToBounds = true
//        imageView.image = kSTARIMAGE.tint(with: SettingsService.mainColor)
        return imageView
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
        
        background.addSubview(labelStackView)
        labelStackView.heightAnchor.constraint(equalTo: background.heightAnchor, multiplier: 0.8).isActive = true
        labelStackView.centerYAnchor.constraint(equalTo: boxImageView.centerYAnchor).isActive = true
        labelStackView.leadingAnchor.constraint(equalTo: boxImageView.trailingAnchor, constant: 10).isActive = true
        
        labelStackView.addArrangedSubview(titleLabel)
        titleLabel.widthAnchor.constraint(equalTo: labelStackView.widthAnchor).isActive = true
        
        labelStackView.addArrangedSubview(descriptionLabel)
        descriptionLabel.widthAnchor.constraint(equalTo: labelStackView.widthAnchor).isActive = true
        
        background.addSubview(starImageView)
        starImageView.centerYAnchor.constraint(equalTo: boxImageView.centerYAnchor).isActive = true
        starImageView.heightAnchor.constraint(equalTo: boxImageView.heightAnchor, multiplier: 0.5).isActive = true
        starImageView.widthAnchor.constraint(equalTo: boxImageView.widthAnchor, multiplier: 0.5).isActive = true
        starImageView.leadingAnchor.constraint(equalTo: labelStackView.trailingAnchor, constant: 10).isActive = true
        starImageView.trailingAnchor.constraint(equalTo: background.trailingAnchor, constant: -10).isActive = true
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
//        starImageView.image = kSTARIMAGE.tint(with: SettingsService.mainColor)
    }
}

