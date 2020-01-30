//
//  CodingConstraintVC.swift
//  MobileClasswork
//
//  Created by Macbook Pro 15 on 1/28/20.
//  Copyright © 2020 SamuelFolledo. All rights reserved.
//

import UIKit

class CodingConstraintVC: UIViewController {

    var purpleView: UIView!
    var redView: UIView!
    var orangeView: UIView!

    override func loadView() { //AppLifeCycle that comes before viewDidLoad, loads once like viewDidLoad
        super.loadView()
        setupPurpleView()
        setupRedView()
        setupOrangeView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func setupOrangeView() {
        orangeView = UIView(frame: .zero)
        orangeView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(orangeView)
        NSLayoutConstraint.activate([ //isActive = true a group of contraints
            orangeView.widthAnchor.constraint(equalTo: purpleView.widthAnchor, multiplier: 2/1),
            orangeView.heightAnchor.constraint(equalTo: orangeView.widthAnchor, multiplier: 1/1),
            orangeView.topAnchor.constraint(equalTo: purpleView.bottomAnchor, constant: 50),
            orangeView.centerXAnchor.constraint(equalTo: purpleView.centerXAnchor),
        ])
        self.orangeView.backgroundColor = .orange
    }
    
    func setupRedView() {
        redView = UIView(frame: .zero)
        redView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(redView)
        NSLayoutConstraint.activate([ //isActive = true a group of contraints
            redView.widthAnchor.constraint(equalTo: purpleView.widthAnchor),
            redView.heightAnchor.constraint(equalTo: redView.widthAnchor, multiplier: 1/1), //make height equal to its width
            redView.leadingAnchor.constraint(equalTo: purpleView.trailingAnchor, constant: 50),
            redView.centerYAnchor.constraint(equalTo: purpleView.centerYAnchor),
        ])
        self.redView.backgroundColor = .red
    }
    
    func setupPurpleView() {
        purpleView = UIView(frame: .zero)
        purpleView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(purpleView)
        NSLayoutConstraint.activate([ //isActive = true a group of contraints
            purpleView.widthAnchor.constraint(equalToConstant: 80),
            purpleView.heightAnchor.constraint(equalTo: purpleView.widthAnchor, multiplier: 1/1),
            purpleView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            purpleView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
        ])
        self.purpleView.backgroundColor = .purple
    }
}
