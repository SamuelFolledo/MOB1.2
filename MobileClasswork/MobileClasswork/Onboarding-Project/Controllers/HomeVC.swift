//
//  HomeVC.swift
//  MobileClasswork
//
//  Created by Macbook Pro 15 on 2/6/20.
//  Copyright © 2020 SamuelFolledo. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {
//MARK: Properties
    
//MARK: Properties Views
    let stackView: UIStackView = {
        let stackView: UIStackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 20
        return stackView
    }()
    let newBoxButton: UIButton = {
        let button: UIButton = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .blue
        button.setTitle("New Box", for: .normal)
        return button
    }()
    let pastBoxesButton: UIButton = {
        let button: UIButton = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .blue
        button.setTitle("Past Boxes", for: .normal)
        return button
    }()
    let profileButton: UIButton = {
        let button: UIButton = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .blue
        button.setTitle("Profile", for: .normal)
        return button
    }()
    let descriptionLabel: UILabel = {
        let label: UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.sizeToFit()
        label.numberOfLines = 0
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
//MARK: App Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
//MARK: Private Methods
    fileprivate func setupViews() {
        self.navigationController?.initRootViewController(vc: self)
        self.navigationController?.isNavigationBarHidden = false
        self.title = "Home"
        self.view.backgroundColor = .white
        self.view.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.8),
            stackView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.8),
            stackView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 50),
            stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
//        stackView.addArrangedSubview(imageView)
//        imageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        stackView.addArrangedSubview(descriptionLabel)
        descriptionLabel.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier:  0.8).isActive = true
        descriptionLabel.text = "Buy me!"
        stackView.addArrangedSubview(newBoxButton)
        newBoxButton.widthAnchor.constraint(equalTo: stackView.widthAnchor, multiplier:  0.8).isActive = true
        newBoxButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        newBoxButton.addTarget(self, action: #selector(newButtonTapped), for: .touchUpInside)
        stackView.addArrangedSubview(pastBoxesButton)
        pastBoxesButton.widthAnchor.constraint(equalTo: newBoxButton.widthAnchor).isActive = true
        pastBoxesButton.heightAnchor.constraint(equalTo: newBoxButton.heightAnchor).isActive = true
        pastBoxesButton.addTarget(self, action: #selector(pastButtonTapped), for: .touchUpInside)
        stackView.addArrangedSubview(profileButton)
        profileButton.widthAnchor.constraint(equalTo: newBoxButton.widthAnchor).isActive = true
        profileButton.heightAnchor.constraint(equalTo: newBoxButton.heightAnchor).isActive = true
        profileButton.addTarget(self, action: #selector(profileButtonTapped), for: .touchUpInside)
    }
    
//MARK: Helpers
    @objc func newButtonTapped() {
        let vc: NewBoxVC = NewBoxVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func pastButtonTapped() {
        let vc: PastBoxesVC = PastBoxesVC()
        navigationController?.pushViewController(vc, animated: true) //push
//        present(vc, animated: true, completion: nil) //modally
    }
    
    @objc func profileButtonTapped() {
//        let homeVC: HomeVC = HomeVC()
//        self.navigationController?.pushViewController(homeVC, animated: true)
    }
}

//MARK: Extensions
