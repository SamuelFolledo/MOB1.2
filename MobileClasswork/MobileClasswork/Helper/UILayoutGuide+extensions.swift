//
//  UILayoutGuide+extensions.swift
//  MobileClasswork
//
//  Created by Macbook Pro 15 on 1/29/20.
//  Copyright © 2020 SamuelFolledo. All rights reserved.
//

import UIKit

extension UILayoutGuide {
    func pinToEdges(view: UIView, inset: UIEdgeInsets = UIEdgeInsets.zero) -> [NSLayoutConstraint] { //pins view to edge
        return [
            leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: inset.left),
            trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: inset.right),
            topAnchor.constraint(equalTo: view.topAnchor, constant: inset.top),
            bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: inset.bottom)
        ]
    }
}
