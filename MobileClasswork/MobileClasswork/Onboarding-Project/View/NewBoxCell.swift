//
//  NewBoxCell.swift
//  MobileClasswork
//
//  Created by Macbook Pro 15 on 2/12/20.
//  Copyright © 2020 SamuelFolledo. All rights reserved.
//

import UIKit

class NewBoxCell: UICollectionViewCell {
    
    static var identifier: String = "newBoxCell"
    
    let stackView: UIStackView = {
        let stackView: UIStackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 20
        return stackView
    }()
    let imageView: UIImageView = {
        let imageView: UIImageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = kMAKESCHOOLIMAGE
        return imageView
    }()
    let textLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Helvetica", size: 26)
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    override func prepareForReuse() {
//        super.prepareForReuse()
//    }
    
    fileprivate func setup() {
        self.backgroundColor = UIColor.darkGray
        self.contentView.layer.cornerRadius = 5
        self.contentView.layer.masksToBounds = true
        self.contentView.addSubview(stackView)
        NSLayoutConstraint.activate([
            self.stackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            self.stackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            self.stackView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.8),
            self.stackView.heightAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.8)
        ])
        stackView.addArrangedSubview(imageView)
        imageView.widthAnchor.constraint(equalTo: stackView.widthAnchor).isActive = true
        self.imageView.heightAnchor.constraint(equalTo: stackView.heightAnchor, multiplier: 0.75)
        stackView.addArrangedSubview(textLabel)
        textLabel.widthAnchor.constraint(equalTo: stackView.widthAnchor).isActive = true
    }
}
