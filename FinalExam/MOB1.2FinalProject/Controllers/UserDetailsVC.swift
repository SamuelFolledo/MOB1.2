//
//  UserDetailsVC.swift
//  MOB1.2FinalProject
//
//  Created by Macbook Pro 15 on 3/3/20.
//  Copyright © 2020 SamuelFolledo. All rights reserved.
//

import UIKit

class UserDetailsVC: UIViewController {
    
    var user: User!
    
    let nameLabel: UILabel = {
        let label: UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.numberOfLines = 1
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "User Details"
        view.backgroundColor = .white
        //show the label
        view.addSubview(nameLabel)
        //populate the label
        nameLabel.text = "\(user.firstName) \(user.lastName)"
        //put it in the middle and use intrinsic content size for height and width
        NSLayoutConstraint.activate([
            nameLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}
