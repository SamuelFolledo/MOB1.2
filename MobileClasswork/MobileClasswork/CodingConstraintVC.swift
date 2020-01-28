//
//  CodingConstraintVC.swift
//  MobileClasswork
//
//  Created by Macbook Pro 15 on 1/28/20.
//  Copyright © 2020 SamuelFolledo. All rights reserved.
//

import UIKit

class CodingConstraintVC: UIViewController {

    var exampleView: UIView!

    override func loadView() {
        super.loadView()

        exampleView = UIView(frame: .zero)
        exampleView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(exampleView)
        NSLayoutConstraint.activate([
            exampleView.widthAnchor.constraint(equalToConstant: 80),
            exampleView.heightAnchor.constraint(equalTo: exampleView.widthAnchor, multiplier: 1/1),
            exampleView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            exampleView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
        ])
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.exampleView.backgroundColor = .purple
    }
}
