//
//  OnboardingPageView.swift
//  MobileClasswork
//
//  Created by Macbook Pro 15 on 1/30/20.
//  Copyright © 2020 SamuelFolledo. All rights reserved.
//

import UIKit

@IBDesignable
class OnboardingPageView: UIView {
    
//MARK: Properties
    var color: UIColor!
    
//MARK: Required methods
    required init(color: UIColor) {
        super.init(frame: .zero)
        self.color = color
        self.setup()
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
    }
    
    fileprivate func setupBackgroundLayer() {
        let gradientLayer: CAGradientLayer = CAGradientLayer()
        gradientLayer.frame = self.bounds
        gradientLayer.colors = [color.cgColor, UIColor.black.cgColor] //add colors, first one will be at the top
        gradientLayer.locations = [0.5, 1]
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
}
