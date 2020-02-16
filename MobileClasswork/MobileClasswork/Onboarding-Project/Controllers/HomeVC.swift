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
    lazy var stackView: UIStackView = {
        let stackView: UIStackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.spacing = 20
        return stackView
    }()
    lazy var newBoxButton: UIButton = {
        let button: UIButton = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
//        button.backgroundColor = .blue
//        button.layer.cornerRadius = button.frame.height / 5
//        button.clipsToBounds = true
        button.setTitle("New Box", for: .normal)
        return button
    }()
    lazy var pastBoxesButton: UIButton = {
        let button: UIButton = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
//        button.backgroundColor = .blue
//        button.layer.cornerRadius = button.frame.height / 5
//        button.clipsToBounds = true
        button.setTitle("Past Boxes", for: .normal)
        return button
    }()
    lazy var profileButton: UIButton = {
        let button: UIButton = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
//        button.backgroundColor = .blue
//        button.layer.cornerRadius = button.frame.height / 5
//        button.clipsToBounds = true
        button.setTitle("Profile", for: .normal)
        return button
    }()
    lazy var descriptionLabel: UILabel = {
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
    override func loadView() {
        super.loadView()
        setupViews()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        newBoxButton.isMainButton()
        pastBoxesButton.isMainButton()
        profileButton.isMainButton()
    }
    
//MARK: Private Methods
    fileprivate func setupViews() {
        self.title = "Home"
        self.view.backgroundColor = kOFFWHITECOLOR
        setupStackView()
//        stackView.addArrangedSubview(descriptionLabel)
//        descriptionLabel.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier:  0.8).isActive = true
//        descriptionLabel.text = "Buy me!"
        setupButtons()
    }
    
    fileprivate func setupStackView() {
        self.view.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.8),
            stackView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.8),
            stackView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20),
            stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
    }
    
    fileprivate func setupButtons() {
        stackView.addArrangedSubview(newBoxButton)
        newBoxButton.widthAnchor.constraint(equalTo: stackView.widthAnchor, multiplier:  0.8).isActive = true
//        newBoxButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        newBoxButton.addTarget(self, action: #selector(newButtonTapped), for: .touchUpInside)
        stackView.addArrangedSubview(pastBoxesButton)
        pastBoxesButton.widthAnchor.constraint(equalTo: newBoxButton.widthAnchor).isActive = true
//        pastBoxesButton.heightAnchor.constraint(equalTo: newBoxButton.heightAnchor).isActive = true
        pastBoxesButton.addTarget(self, action: #selector(pastButtonTapped), for: .touchUpInside)
        stackView.addArrangedSubview(profileButton)
        profileButton.widthAnchor.constraint(equalTo: newBoxButton.widthAnchor).isActive = true
//        profileButton.heightAnchor.constraint(equalTo: newBoxButton.heightAnchor).isActive = true
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
