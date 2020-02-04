//
//  OnboardingPageView.swift
//  MobileClasswork
//
//  Created by Macbook Pro 15 on 1/30/20.
//  Copyright © 2020 SamuelFolledo. All rights reserved.
//

import UIKit

class OnboardingPageView: UIView {
    
//MARK: Properties
    var color: UIColor!
//    var pageImage: UIImage!
//    var pageDescription: String!
    var isLastPage: Bool!
    
//MARK: Properties Views
    let imageView: UIImageView = {
        let imageView: UIImageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = kMAKESCHOOLIMAGE
        return imageView
    }()
    let descriptionLabel: UILabel = {
        let label: UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.sizeToFit()
        label.numberOfLines = 0
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    let continueButton: UIButton = {
        let button: UIButton = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .black
        button.setTitle("Continue", for: .normal)
        return button
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
    
//MARK: Required methods
    required init(color: UIColor, pageImage: UIImage, description: String, isLastPage: Bool = false) {
        super.init(frame: .zero)
        self.color = color
        self.imageView.image = pageImage
        self.descriptionLabel.text = description
//        self.pageImage = pageImage
//        self.pageDescription = description
        self.isLastPage = isLastPage
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    override func layoutSubviews() { //where you can set
        setupBackgroundLayer()
    }
    
//MARK: Private methods
    fileprivate func setup() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.8),
            stackView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.8),
//            stackView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 50),
            stackView.centerXAnchor.constraint(equalTo: self.centerXAnchor)
//            stackView.contentHuggingPriority(for: <#T##NSLayoutConstraint.Axis#>)
//            stackView.contentCompressionResistancePriority(for: <#T##NSLayoutConstraint.Axis#>)
        ])
        stackView.addArrangedSubview(imageView)
        imageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        stackView.addArrangedSubview(descriptionLabel)
        descriptionLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier:  0.8).isActive = true
        stackView.addArrangedSubview(continueButton)
        continueButton.isHidden = self.isLastPage ? false : true //if it is the last page then dont hide it
        continueButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier:  0.8).isActive = true
        continueButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
//        imageView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.8)
//        imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 1)
//        imageView.centerYAnchor.constraint(equalTo: self.centerYAnchor)
//        imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 100)
//        descriptionLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.8)
////        descriptionLabel.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 1)
//        descriptionLabel.centerYAnchor.constraint(equalTo: imageView.centerYAnchor)
//        descriptionLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 50)
    }
    
    fileprivate func setupBackgroundLayer() {
        let gradientLayer: CAGradientLayer = CAGradientLayer()
        gradientLayer.frame = self.bounds
        gradientLayer.colors = [color.cgColor, UIColor.black.cgColor] //add colors, first one will be at the top
        gradientLayer.locations = [0.5, 1]
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
}
