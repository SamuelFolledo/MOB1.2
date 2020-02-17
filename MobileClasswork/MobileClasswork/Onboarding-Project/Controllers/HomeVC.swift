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
    lazy var settingsButton: UIBarButtonItem = {
        let barButton: UIBarButtonItem = UIBarButtonItem()
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
        updateColors()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        updateColors()
    }
    
//MARK: Private Methods
    fileprivate func updateColors() {
        view.backgroundColor = SettingsService.whiteColor
        newBoxButton.isMainButton()
        pastBoxesButton.isMainButton()
        profileButton.isMainButton()
    }
    
    fileprivate func setupViews() {
        self.view.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.widthAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.8),
            stackView.heightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.8),
            stackView.centerYAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor)
        ])
        setupStackView()
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
        navigationController?.navigationBar.tintColor = SettingsService.grayColor //button color
        self.title = "Home"
        navigationController?.setStatusBarColor(backgroundColor: kMAINCOLOR)
        settingsButton = UIBarButtonItem.navButton(self, action: #selector(settingsButtonTapped), image: kSETTINGSIMAGE)
        navigationItem.rightBarButtonItem = settingsButton
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
//        vc.modalPresentationStyle = .custom
//        vc.modalPresentationStyle = .overCurrentContext
        navigationController?.pushViewController(vc, animated: false) //push
    }
}

//MARK: Extensions
