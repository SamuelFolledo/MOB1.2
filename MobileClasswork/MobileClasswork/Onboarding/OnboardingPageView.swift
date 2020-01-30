//
//  OnboardingPageView.swift
//  MobileClasswork
//
//  Created by Macbook Pro 15 on 1/30/20.
//  Copyright © 2020 SamuelFolledo. All rights reserved.
//

import UIKit

class OnboardingPageView: UIView {
    var color: UIColor!
    
    required init(color: UIColor) {
        super.init(frame: .zero)
        self.color = color
        self.setup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup() {
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    override func layoutSubviews() {
        let gradientLayer: CAGradientLayer = CAGradientLayer()
        gradientLayer.frame = self.bounds
        gradientLayer.colors = [color.cgColor, UIColor.black.cgColor] //add colors, first one will be at the top
        gradientLayer.locations = [0.5, 1]
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
}
