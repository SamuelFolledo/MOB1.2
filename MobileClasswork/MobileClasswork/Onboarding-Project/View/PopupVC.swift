//
//  PopupVC.swift
//  MobileClasswork
//
//  Created by Macbook Pro 15 on 2/15/20.
//  Copyright © 2020 SamuelFolledo. All rights reserved.
//

import UIKit

class PopupVC: UIViewController {
//MARK: Properties
//    var hasKeyboard: Bool = false
//    var delegate: ScannerMailProtocol!
//    var mail: Mail!
//    var mailImage: UIImage!
    
//MARK: IBOutlets
    lazy var popUpView: UIView = {
        let view: UIView = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = kOFFWHITECOLOR
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(popupViewTap(_:)))
        view.addGestureRecognizer(tap)
        return view
    }()
    lazy var stackView: UIStackView = {
        let stackView: UIStackView = UIStackView(frame: .zero)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 10
        return stackView
    }()
    lazy var titleLabel: UILabel = {
        let label: UILabel = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.sizeToFit()
        label.numberOfLines = 1
        label.text = "Settings"
        label.backgroundColor = kMAINCOLOR
        label.textColor = kOFFWHITECOLOR
        label.textAlignment = .center
        return label
    }()
    lazy var settingLabel: UILabel = {
        let label: UILabel = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        label.numberOfLines = 0
        label.textColor = .gray
        label.text = "Developed by Samuel P. Folledo"
        label.textAlignment = .center
        return label
    }()
    lazy var cancelButton: UIButton = {
        let button: UIButton = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Cancel", for: .normal)
        button.addTarget(self, action: #selector(handleDismissTap(_:)), for: .touchUpInside)
        return button
    }()
    lazy var buttonsStackView: UIStackView = {
        let stackView: UIStackView = UIStackView(frame: .zero)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        return stackView
    }()
    lazy var logoutButton: UIButton = {
        let button: UIButton = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Logout", for: .normal)
        button.addTarget(self, action: #selector(logoutButtonTap(_:)), for: .touchUpInside)
        return button
    }()
    lazy var saveButton: UIButton = {
        let button: UIButton = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Save", for: .normal)
        button.addTarget(self, action: #selector(saveButtonTap(_:)), for: .touchUpInside)
        return button
    }()
    lazy var darkStackView: UIStackView = {
        let stackView: UIStackView = UIStackView(frame: .zero)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 10
        return stackView
    }()
    lazy var darkModeLabel: UILabel = {
        let label: UILabel = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        label.numberOfLines = 1
        label.textColor = kOFFBLACKCOLOR
        label.text = "Dark Mode: "
        label.textAlignment = .left
        return label
    }()
    lazy var darkSwitch: UISwitch = {
        let darkSwitch: UISwitch = UISwitch(frame: .zero)
        darkSwitch.translatesAutoresizingMaskIntoConstraints = false
        darkSwitch.isOn = false
        darkSwitch.onTintColor = kOFFBLACKCOLOR
        darkSwitch.thumbTintColor = .red
        darkSwitch.backgroundColor = .yellow
        darkSwitch.tintColor = .green
        darkSwitch.addTarget(self, action: #selector(switchChanged), for: .touchUpInside)
        return darkSwitch
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
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }
    
    override func viewDidLayoutSubviews() {
        logoutButton.isMainButton(color: kOFFBLACKCOLOR)
        cancelButton.isClearButton(titleColor: kMAINCOLOR)
//        cancelButton.isBlackButton()
        saveButton.isMainButton()
    }
    
//MARK: Private Methods
    fileprivate func setupViews() {
        view.backgroundColor = UIColor.black.withAlphaComponent(0.6)
//        view.isUserInteractionEnabled = true
//        view.backgroundColor = .clear
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleDismissTap(_:)))
        self.view.addGestureRecognizer(tap)
        view.insertSubview(popUpView, aboveSubview: self.view)
//        popUpView.isUserInteractionEnabled = true
        NSLayoutConstraint.activate([
            popUpView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.75),
            popUpView.heightAnchor.constraint(equalTo: popUpView.widthAnchor),
            popUpView.centerYAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerYAnchor),
            popUpView.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor)
        ])
        popUpView.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.widthAnchor.constraint(equalTo: self.popUpView.widthAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 50),
            titleLabel.topAnchor.constraint(equalTo: self.popUpView.topAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: self.popUpView.centerXAnchor)
        ])
        popUpView.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            stackView.leadingAnchor.constraint(equalTo: popUpView.leadingAnchor, constant: 10),
            stackView.bottomAnchor.constraint(equalTo: popUpView.bottomAnchor, constant: -10),
            stackView.trailingAnchor.constraint(equalTo: popUpView.trailingAnchor, constant: -10)
        ])
        showAnimate()
        setupDarkViews()
        stackView.addArrangedSubview(settingLabel)
        settingLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        setupButtons()
    }
    
    fileprivate func setupButtons() {
        stackView.addArrangedSubview(logoutButton)
        stackView.addArrangedSubview(buttonsStackView)
        NSLayoutConstraint.activate([
            logoutButton.widthAnchor.constraint(equalTo: stackView.widthAnchor),
            logoutButton.heightAnchor.constraint(equalToConstant: 50),
            buttonsStackView.widthAnchor.constraint(equalTo: stackView.widthAnchor),
            buttonsStackView.heightAnchor.constraint(equalToConstant: 50)
        ])
        buttonsStackView.addArrangedSubview(cancelButton)
        buttonsStackView.addArrangedSubview(saveButton)
    }
    
    fileprivate func setupDarkViews() {
        stackView.addArrangedSubview(darkStackView)
        NSLayoutConstraint.activate([
            darkStackView.widthAnchor.constraint(equalTo: stackView.widthAnchor),
            darkStackView.heightAnchor.constraint(equalToConstant: 50),
        ])
        darkStackView.addArrangedSubview(darkModeLabel)
        NSLayoutConstraint.activate([
        ])
        darkStackView.addArrangedSubview(darkSwitch)
    }
    
    fileprivate func showAnimate() { //show popup with animation
        view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        view.alpha = 0.0;
        UIView.animate(withDuration: 0.25, animations: {
            self.view.alpha = 1.0
            self.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        });
    }
    
    fileprivate func dismissPopup() { //dismiss popup with animation
        UIView.animate(withDuration: 0.25, animations: {
            self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            self.view.alpha = 0.0;
        }, completion:{(finished : Bool)  in
            if (finished) {
                self.view.removeFromSuperview()
                self.navigationController?.popViewController(animated: false)
            }
        });
    }
    
//MARK: Helpers
    @objc func handleDismissTap(_ gesture: UITapGestureRecognizer) { //go to imageDetailVC
        dismissPopup()
    }
    @objc func logoutButtonTap(_ gesture: UITapGestureRecognizer) { //go to imageDetailVC
        let vc: LoginVC = LoginVC()
        self.navigationController?.initRootViewController(vc: vc)
    }
    @objc func saveButtonTap(_ gesture: UITapGestureRecognizer) { //go to imageDetailVC
        dismissPopup()
    }
    @objc func popupViewTap(_ gesture: UITapGestureRecognizer) { //go to imageDetailVC
//        navigationController?.popViewController(animated: false)
        print("Do nothing")
    }
    @objc func switchChanged() {
        print(darkSwitch.isOn ? "Dark mode on" : "Dark mode off")
        Service.isDarkMode = darkSwitch.isOn ? true : false
    }
}

//MARK: Extensions
