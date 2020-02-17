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
    let containerView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = SettingsService.grayColor
        return view
    }()
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
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
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
        self.backgroundColor = .clear
        self.containerView.layer.cornerRadius = 10
        self.containerView.layer.masksToBounds = true
        self.contentView.addSubview(containerView)
        NSLayoutConstraint.activate([
            self.containerView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            self.containerView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            self.containerView.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            self.containerView.heightAnchor.constraint(equalTo: contentView.heightAnchor)
        ])
        self.containerView.addSubview(stackView)
        NSLayoutConstraint.activate([
            self.stackView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            self.stackView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            self.stackView.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.8),
            self.stackView.heightAnchor.constraint(equalTo: containerView.heightAnchor, multiplier: 0.8)
        ])
        stackView.addArrangedSubview(imageView)
        imageView.widthAnchor.constraint(equalTo: stackView.widthAnchor).isActive = true
        self.imageView.heightAnchor.constraint(equalTo: stackView.heightAnchor, multiplier: 0.75).isActive = true
        stackView.addArrangedSubview(textLabel)
        textLabel.widthAnchor.constraint(equalTo: stackView.widthAnchor).isActive = true
    }
}
