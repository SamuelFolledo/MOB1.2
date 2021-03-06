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
    var isLastPage: Bool!
    
//MARK: Properties Views
    lazy var imageView: UIImageView = {
        let imageView: UIImageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    lazy var descriptionLabel: UILabel = {
        let label: UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 28, weight: .bold)
        label.sizeToFit()
        label.numberOfLines = 0
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    lazy var continueButton: UIButton = {
        let button: UIButton = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Continue", for: .normal)
        return button
    }()
    lazy var titleLabel: UILabel = {
        let label: UILabel = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 32, weight: .black)
        label.sizeToFit()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.text = kAPPNAME
        return label
    }()
    lazy var stackView: UIStackView = {
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
//        continueButton.isMainButton() //since isMainButton extension has border and needs height for customization, need to call it in layoutSubviews
        continueButton.isWhiteButton()
        setupBackgroundLayer()
    }
    
//MARK: Private methods
    fileprivate func setup() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.8),
//            stackView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.7),
            stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 100),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -100),
            stackView.centerXAnchor.constraint(equalTo: self.centerXAnchor)
//            stackView.contentHuggingPriority(for: <#T##NSLayoutConstraint.Axis#>)
//            stackView.contentCompressionResistancePriority(for: <#T##NSLayoutConstraint.Axis#>)
        ])
        setupTitleLabel()
        stackView.addArrangedSubview(imageView)
        imageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        stackView.addArrangedSubview(descriptionLabel)
        descriptionLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier:  0.8).isActive = true
        stackView.addArrangedSubview(continueButton)
        continueButton.isHidden = self.isLastPage ? false : true //if it is the last page then dont hide it
        continueButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier:  0.8).isActive = true
        continueButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    fileprivate func setupTitleLabel() {
        stackView.addArrangedSubview(titleLabel) //just to make it the same size and look as the loginVC
        titleLabel.heightAnchor.constraint(equalToConstant: 80).isActive = true
        titleLabel.alpha = 0.0
    }
    
    fileprivate func setupBackgroundLayer() {
        let gradientLayer: CAGradientLayer = CAGradientLayer()
        gradientLayer.frame = self.bounds
        gradientLayer.colors = [color.cgColor, UIColor.black.cgColor] //add colors, first one will be at the top
        gradientLayer.locations = [0.5, 1]
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
    
//MARK: Helpers
}
