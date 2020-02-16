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
        button.setTitle("New Box", for: .normal)
        return button
    }()
    lazy var pastBoxesButton: UIButton = {
        let button: UIButton = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Past Boxes", for: .normal)
        return button
    }()
    lazy var profileButton: UIButton = {
        let button: UIButton = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Profile", for: .normal)
        return button
    }()
    lazy var descriptionLabel: UILabel = {
        let label: UILabel = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.sizeToFit()
        label.numberOfLines = 0
        label.textColor = kOFFBLACKCOLOR
        label.textAlignment = .center
        return label
    }()
    lazy var settingsButton: UIBarButtonItem = {
        let barButton: UIBarButtonItem = UIBarButtonItem()
//        barButton.setBackgroundImage(kSETTINGSIMAGE.withTintColor(kOFFWHITECOLOR), for: .normal, barMetrics: .default)
        return barButton
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
        setupNavigationBar()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        newBoxButton.isMainButton()
        pastBoxesButton.isMainButton()
        profileButton.isMainButton()
        settingsButton = UIBarButtonItem.navButton(self, action: #selector(settingsButtonTapped), image: kSETTINGSIMAGE)
        navigationItem.rightBarButtonItem = settingsButton
        
    }
    
//MARK: Private Methods
    fileprivate func setupViews() {
        self.view.backgroundColor = kOFFWHITECOLOR
//        navigationItem.rightBarButtonItem = settingsButton
        self.view.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.widthAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.8),
            stackView.heightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.8),
            stackView.centerYAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor)
        ])
//        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Update", style: .done, target: self, action: nil)
        
        setupStackView()
//        stackView.addArrangedSubview(descriptionLabel)
//        descriptionLabel.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier:  0.8).isActive = true
//        descriptionLabel.text = "Buy me!"
        setupButtons()
    }
    
    fileprivate func setupStackView() {
        self.view.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.widthAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.8),
            stackView.heightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.8),
            stackView.centerYAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor)
        ])
    }
    
    fileprivate func setupButtons() {
        stackView.addArrangedSubview(newBoxButton)
        newBoxButton.widthAnchor.constraint(equalTo: stackView.widthAnchor, multiplier:  0.8).isActive = true
        newBoxButton.addTarget(self, action: #selector(newButtonTapped), for: .touchUpInside)
        stackView.addArrangedSubview(pastBoxesButton)
        pastBoxesButton.widthAnchor.constraint(equalTo: newBoxButton.widthAnchor).isActive = true
        pastBoxesButton.addTarget(self, action: #selector(pastButtonTapped), for: .touchUpInside)
        stackView.addArrangedSubview(profileButton)
        profileButton.widthAnchor.constraint(equalTo: newBoxButton.widthAnchor).isActive = true
        profileButton.addTarget(self, action: #selector(profileButtonTapped), for: .touchUpInside)
    }
    
    fileprivate func setupNavigationBar() {
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.tintColor = kOFFWHITECOLOR //button color
        self.title = "Home"
        navigationController?.setStatusBarColor(backgroundColor: kMAINCOLOR)
//        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Update", style: .done, target: self, action: #selector(showOptions(controller:)))
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
//MARK: Helpers
    @objc func newButtonTapped() {
        let vc: NewBoxVC = NewBoxVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @objc func pastButtonTapped() {
        let vc: PastBoxesVC = PastBoxesVC()
        navigationController?.pushViewController(vc, animated: true) //push
    }
    @objc func profileButtonTapped() {
        let vc: Day8VC = Day8VC()
        navigationController?.pushViewController(vc, animated: true) //push
    }
    @objc func settingsButtonTapped() {
        let vc: PopupVC = PopupVC()
        navigationController?.pushViewController(vc, animated: true) //push
    }
}

//MARK: Extensions
