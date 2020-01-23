//
//  UIViewController+extensions.swift
//  MobileClasswork
//
//  Created by Macbook Pro 15 on 1/23/20.
//  Copyright © 2020 SamuelFolledo. All rights reserved.
//

import UIKit

extension UIViewController {
    static func loadFromNib() -> Self {
        func instantiateFromNib<T: UIViewController>() -> T {
            return T.init(nibName: String(describing: T.self), bundle: nil)
        }
        return instantiateFromNib()
    }
}
