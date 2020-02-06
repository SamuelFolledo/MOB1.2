//
//  OnboardingModel.swift
//  MobileClasswork
//
//  Created by Macbook Pro 15 on 2/4/20.
//  Copyright © 2020 SamuelFolledo. All rights reserved.
//

import UIKit

class OnboardingModel {
    
    let color: UIColor!
    let image: UIImage!
    let description: String!
    
    init(_color: UIColor, _image: UIImage, _description: String) {
        self.color = _color
        self.image = _image
        self.description = _description
    }
}
