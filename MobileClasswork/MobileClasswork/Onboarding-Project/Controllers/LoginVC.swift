//
//  LoginVC.swift
//  MobileClasswork
//
//  Created by Macbook Pro 15 on 2/6/20.
//  Copyright © 2020 SamuelFolledo. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    lazy var hasKeyboard: Bool = false
//MARK: Properties
    lazy var emailTextField: UnderlinedTextField = {
        let textField = UnderlinedTextField(frame: .zero)
        textField.translatesAutoresizingMaskIntoConstraints = false
        let attributedPlaceHolder = NSAttributedString(string: "Email", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray]) //create a string with font color for placeholder
        textField.attributedPlaceholder = attributedPlaceHolder
        textField.isEmailTextField()
        return textField
    }()
    lazy var passwordTextField: UnderlinedTextField = {
        let textField = UnderlinedTextField(frame: .zero)
        textField.translatesAutoresizingMaskIntoConstraints = false
        let attributedPlaceHolder = NSAttributedString(string: "Email", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray]) //create a string with font color for placeholder
        textField.attributedPlaceholder = attributedPlaceHolder
        textField.isPasswordTextField()
        return textField
    }()
    
//MARK: Properties Views
    lazy var loginButton: UIButton = {
        let button: UIButton = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Login", for: .normal)
        return button
    }()
    lazy var skipButton: UIButton = {
        let button: UIButton = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Skip To Home", for: .normal)
        
        return button
    }()
    lazy var imageView: UIImageView = {
        let imageView: UIImageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.image = kMIGRAINEIMAGE
//        imageView.image = imageView.image?.withRenderingMode(.alwaysTemplate)
        return imageView
    }()
    lazy var titleLabel: UILabel = {
        let label: UILabel = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 32, weight: .black)
        label.sizeToFit()
        label.numberOfLines = 0
//        label.textColor = kOFFBLACKCOLOR
        label.textAlignment = .center
        label.text = kAPPNAME
        return label
    }()
    lazy var stackView: UIStackView = {
        let stackView: UIStackView = UIStackView(frame: .zero)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 20
        return stackView
    }()
    lazy var darkStackView: UIStackView = {
        let stackView: UIStackView = UIStackView(frame: .zero)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .trailing
        stackView.distribution = .fill
        stackView.spacing = 10
        return stackView
    }()
    lazy var darkModeLabel: UILabel = {
        let label: UILabel = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        label.numberOfLines = 1
        label.text = "Dark Mode: "
        label.textAlignment = .left
        return label
    }()
    lazy var darkSwitch: UISwitch = {
        let darkSwitch: UISwitch = UISwitch(frame: .zero)
        darkSwitch.translatesAutoresizingMaskIntoConstraints = false
        let isDarkMode = UserDefaults.standard.bool(forKey: "isDarkMode")
        darkSwitch.isOn = isDarkMode
        darkSwitch.thumbTintColor = SettingsService.mainColor
        darkSwitch.addTarget(self, action: #selector(self.switchChanged), for: .touchUpInside)
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
        self.tabBarController?.tabBar.isHidden = true
        let isDarkMode = UserDefaults.standard.bool(forKey: "isDarkMode")
        darkSwitch.isOn = isDarkMode
        updateColors()
        setupKeyboardNotifications()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.tabBarController?.tabBar.isHidden = false
        removeKeyboardObervers()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        updateColors()
    }
    
//MARK: Private Methods
    fileprivate func updateColors() {
        loginButton.isMainButton() //since isMainButton() extension has corner radius which needs height for customization, need to call it in viewDidLayoutSubviews
        skipButton.isClearButton()
        darkModeLabel.textColor = SettingsService.darkGrayColor
        titleLabel.textColor = SettingsService.darkGrayColor
        view.backgroundColor = SettingsService.whiteColor
        emailTextField.setUnderlineColor(color: SettingsService.darkGrayColor)
        emailTextField.tintColor = SettingsService.darkGrayColor
        emailTextField.textColor = SettingsService.darkGrayColor
        passwordTextField.setUnderlineColor(color: SettingsService.darkGrayColor)
        passwordTextField.tintColor = SettingsService.darkGrayColor
        passwordTextField.textColor = SettingsService.darkGrayColor
        imageView.image = kMIGRAINEIMAGE.tint(with: SettingsService.darkGrayColor)
    }
    
    fileprivate func setupViews() {
        self.navigationController?.initRootViewController(vc: self)
        self.navigationController?.isNavigationBarHidden = true
        self.view.backgroundColor = kOFFWHITECOLOR
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleDismissTap(_:)))
        self.view.addGestureRecognizer(tap)
        setupDarkViews()
        setupStackView()
        setupTitleLabel()
        setupImageView()
        setupTextFields()
        setupLoginButton()
    }
    
    fileprivate func setupStackView() {
        self.view.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.8),
            stackView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.85),
            stackView.topAnchor.constraint(equalTo: self.darkStackView.bottomAnchor, constant: 10),
            stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
    }
    
    fileprivate func setupTextFields() {
        stackView.addArrangedSubview(emailTextField)
        stackView.addArrangedSubview(passwordTextField)
        NSLayoutConstraint.activate([
            emailTextField.heightAnchor.constraint(equalToConstant: 50),
            emailTextField.widthAnchor.constraint(equalTo: stackView.widthAnchor),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            passwordTextField.widthAnchor.constraint(equalTo: stackView.widthAnchor)
        ])
    }
    
    fileprivate func setupLoginButton() {
        stackView.addArrangedSubview(loginButton)
        loginButton.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier:  0.8).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        stackView.addArrangedSubview(skipButton)
        skipButton.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier:  0.8).isActive = true
        skipButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        skipButton.addTarget(self, action: #selector(skipButtonTapped), for: .touchUpInside)
    }
    
    fileprivate func setupTitleLabel() {
        stackView.addArrangedSubview(titleLabel)
        titleLabel.widthAnchor.constraint(equalTo: stackView.widthAnchor, multiplier: 1.0).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 80).isActive = true
    }
    
    fileprivate func setupImageView() {
        stackView.addArrangedSubview(imageView)
        imageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
    }
    
    fileprivate func setupDarkViews() {
        self.view.addSubview(darkStackView)
        NSLayoutConstraint.activate([
//            darkStackView.widthAnchor.constraint(equalTo: stackView.widthAnchor),
            darkStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            darkStackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10),
            darkStackView.heightAnchor.constraint(equalToConstant: 50),
//            darkStackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6)
        ])
        darkStackView.addArrangedSubview(darkModeLabel)
        NSLayoutConstraint.activate([
        ])
        darkStackView.addArrangedSubview(darkSwitch)
    }
    
//MARK: Helpers
    @objc func loginButtonTapped() {
        SettingsService.saveIsDarkMode()
        let vc: TabBarController = TabBarController()
        self.navigationController?.initRootViewController(vc: vc)
    }
    
    @objc func skipButtonTapped() {
        SettingsService.saveIsDarkMode()
        let vc: TabBarController = TabBarController()
        self.navigationController?.initRootViewController(vc: vc)
    }
    
    @objc func handleDismissTap(_ gesture: UITapGestureRecognizer) { //if keyboard is up, dismiss keyboard, else dismiss popup
        self.view.endEditing(true)
    }
    
    @objc func switchChanged() {
        SettingsService.isDarkMode = darkSwitch.isOn ? true : false
        updateColors()
    }
}

//MARK: Extensions
//MARK: Keyboard Helpers
extension LoginVC {
    fileprivate func setupKeyboardNotifications() { //setup notifications when keyboard shows or hide
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    fileprivate func removeKeyboardObervers() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
    }
    @objc func keyboardWillShow(notification: NSNotification) { //makes the view go up by keyboard's height
        hasKeyboard = true
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if view.frame.origin.y == 0 {
                view.frame.origin.y -= keyboardSize.height * 0.6
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) { //put the view back to 0
        hasKeyboard = false
        if view.frame.origin.y != 0 {
            view.frame.origin.y = 0
        }
    }
}

