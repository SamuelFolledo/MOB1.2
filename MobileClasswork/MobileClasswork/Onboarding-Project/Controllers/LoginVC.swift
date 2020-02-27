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
    var titleConstraintStart: NSLayoutConstraint!
    var titleConstraintEnd: NSLayoutConstraint!
    
//MARK: Properties Views
    lazy var loginButton: UIButton = {
        let button: UIButton = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Login", for: .normal)
        button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        return button
    }()
    lazy var skipButton: UIButton = {
        let button: UIButton = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Skip To Home", for: .normal)
        button.addTarget(self, action: #selector(skipButtonTapped), for: .touchUpInside)
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
        label.textAlignment = .center
        label.text = kAPPNAME
        return label
    }()
    lazy var backButton: UIButton = {
        let button: UIButton = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        button.setTitleColor(SettingsService.darkGrayColor, for: .normal)
        button.setImage(kBACKBUTTONIMAGE.withTintColor(SettingsService.darkGrayColor), for: .normal)
        button.imageView?.contentMode = .scaleAspectFill //contentMode for buttons
        button.contentMode = .left
//        button.contentEdgeInsets = UIEdgeInsets(top: 0, left: -20, bottom: 0, right: 0)
        button.contentHorizontalAlignment = .left //push contents to the left
        button.addTarget(self, action: #selector(self.backButtonTapped), for: .touchUpInside)
        return button
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
        self.navigationController?.navigationBar.prefersLargeTitles = false
        if self == self.navigationController?.viewControllers[0] { //if loginVC is the rootVC, hide the backButton
            backButton.isHidden = true
        }
        self.tabBarController?.tabBar.isHidden = true
        let isDarkMode = UserDefaults.standard.bool(forKey: "isDarkMode")
        darkSwitch.isOn = isDarkMode
        updateColors()
        setupKeyboardNotifications()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animateTitleAndButton()
    }
    
    fileprivate func animateTitleAndButton() {
        titleConstraintStart.isActive = false
        titleConstraintEnd.isActive = true //makes a going up animation
        UIView.animate(withDuration: 1.0, delay: 0.0, usingSpringWithDamping: 0.4, initialSpringVelocity: 0, options: [.curveEaseOut], animations: { //create a bounce effect as we are setting titleLabel's original size
            self.titleLabel.transform = CGAffineTransform(scaleX: 1, y: 1)
            self.view.layoutIfNeeded()
        }) { (_) in
            UIView.animate(withDuration: 0.25, delay: 0.0, options: [.curveEaseOut], animations: {
                self.loginButton.alpha = 1.0
            },completion: nil)
        }
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
        backButton.setImage(kBACKBUTTONIMAGE.withTintColor(SettingsService.darkGrayColor), for: .normal)
    }
    
    fileprivate func setupViews() {
        self.navigationController?.isNavigationBarHidden = true
        self.view.backgroundColor = kOFFWHITECOLOR
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleDismissTap(_:)))
        self.view.addGestureRecognizer(tap)
        setupDarkViews()
        setupBackButton()
        setupImageView()
        setupTitleLabel()
        setupTextFields()
        setupLoginButton()
    }
    
    fileprivate func setupBackButton() {
        view.addSubview(backButton)
        NSLayoutConstraint.activate([
            backButton.centerYAnchor.constraint(equalTo: darkSwitch.centerYAnchor),
            backButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 5),
            backButton.heightAnchor.constraint(equalToConstant: 25),
            backButton.widthAnchor.constraint(equalToConstant: 100),
        ])
    }
    
    fileprivate func setupDarkViews() {
        self.view.addSubview(darkStackView)
        NSLayoutConstraint.activate([
            darkStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            darkStackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10),
            darkStackView.heightAnchor.constraint(equalToConstant: 50),
        ])
        darkStackView.addArrangedSubview(darkModeLabel)
        NSLayoutConstraint.activate([
        ])
        darkStackView.addArrangedSubview(darkSwitch)
    }
    
    fileprivate func setupImageView() {
        view.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalToConstant: 200),
            imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor, multiplier: 1.0),
            imageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -50)
        ])
    }
    
    fileprivate func setupTitleLabel() {
        titleConstraintStart = titleLabel.centerYAnchor.constraint(equalTo: imageView.centerYAnchor, constant: 5) //assign the start constraint
        titleConstraintEnd = titleLabel.centerYAnchor.constraint(equalTo: imageView.topAnchor, constant: -60)
        view.addSubview(titleLabel)
        titleLabel.transform = CGAffineTransform(scaleX: 0, y: 0) //intialize as 0 scale
        titleLabel.centerXAnchor.constraint(equalTo: imageView.centerXAnchor).isActive = true
        titleLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 80).isActive = true
        titleConstraintStart.isActive = true //activate start constraint
    }
    
    fileprivate func setupTextFields() {
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        NSLayoutConstraint.activate([
            emailTextField.heightAnchor.constraint(equalToConstant: 50),
            emailTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            emailTextField.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            emailTextField.centerXAnchor.constraint(equalTo: imageView.centerXAnchor),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            passwordTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
            passwordTextField.centerXAnchor.constraint(equalTo: emailTextField.centerXAnchor),
        ])
    }
    
    fileprivate func setupLoginButton() {
        view.addSubview(loginButton)
        loginButton.alpha = 0.0
        view.addSubview(skipButton)
        NSLayoutConstraint.activate([
            loginButton.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier:  0.8),
            loginButton.heightAnchor.constraint(equalToConstant: 50),
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
            loginButton.centerXAnchor.constraint(equalTo: emailTextField.centerXAnchor),
            skipButton.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier:  0.8),
            skipButton.heightAnchor.constraint(equalToConstant: 50),
            skipButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 20),
            skipButton.centerXAnchor.constraint(equalTo: emailTextField.centerXAnchor),
            skipButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -25)
        ])
    }
    
//MARK: Helpers
    @objc func backButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func loginButtonTapped() {
        SettingsService.saveIsDarkMode()
        let vc: TabBarController = TabBarController()
        self.navigationController?.initRootVC(vc: vc, fromRight: true)
    }
    
    @objc func skipButtonTapped() {
        SettingsService.saveIsDarkMode()
        let vc: TabBarController = TabBarController()
        self.navigationController?.initRootVC(vc: vc, fromRight: true)
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

