//
//  UIButton+extensions.swift
//  MobileClasswork
//
//  Created by Macbook Pro 15 on 2/6/20.
//  Copyright © 2020 SamuelFolledo. All rights reserved.
//

import UIKit

extension UIButton {
    func isMainButton() { //applied border width and rounded corners
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.cornerRadius = self.frame.height / 5
        self.clipsToBounds = true
    }
}
