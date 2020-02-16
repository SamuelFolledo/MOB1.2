//
//  UIButton+extensions.swift
//  MobileClasswork
//
//  Created by Macbook Pro 15 on 2/6/20.
//  Copyright © 2020 SamuelFolledo. All rights reserved.
//

import UIKit

extension UIButton {
/// applied main color and rounded corners
    func isMainButton(color: UIColor = kMAINCOLOR) {
//        self.layer.borderWidth = 2
//        self.layer.borderColor = UIColor.white.cgColor
        self.backgroundColor = color
        self.titleLabel?.font = .systemFont(ofSize: 24, weight: .semibold)
        self.setTitleColor(kOFFWHITECOLOR, for: .normal)
//        self.layer.cornerRadius = self.frame.height / 5
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
//        self.layer.masksToBounds = true
    }
    
    func isWhiteButton() {
        self.backgroundColor = kOFFWHITECOLOR
        self.titleLabel?.font = .systemFont(ofSize: 24, weight: .medium)
        self.setTitleColor(kOFFBLACKCOLOR, for: .normal)
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
    }
    
    func isBlackButton() {
        self.backgroundColor = kOFFBLACKCOLOR
        self.titleLabel?.font = .systemFont(ofSize: 24, weight: .medium)
        self.setTitleColor(kOFFWHITECOLOR, for: .normal)
        self.layer.cornerRadius = self.frame.height / 5
        self.clipsToBounds = true
    }
    
    func isClearButton(titleColor: UIColor = kOFFBLACKCOLOR) {
        self.backgroundColor = .clear
        self.setTitleColor(titleColor, for: .normal)
        self.titleLabel?.font = .systemFont(ofSize: 24, weight: .medium)
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
    }
}
