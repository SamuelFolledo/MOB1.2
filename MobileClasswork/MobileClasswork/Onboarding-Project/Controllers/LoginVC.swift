//
//  LoginVC.swift
//  MobileClasswork
//
//  Created by Macbook Pro 15 on 2/6/20.
//  Copyright © 2020 SamuelFolledo. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
//MARK: Properties
    lazy var emailTextField: UnderlinedTextField = {
        let textField = UnderlinedTextField(frame: .zero)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.isEmailTextField()
        return textField
    }()
    lazy var passwordTextField: UnderlinedTextField = {
        let textField = UnderlinedTextField(frame: .zero)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.isPasswordTextField()
        return textField
    }()
    
//MARK: Properties Views
    lazy var loginButton: UIButton = {
        let button: UIButton = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .black
        button.setTitle("Login", for: .normal)
        return button
    }()
    lazy var imageView: UIImageView = {
        let imageView: UIImageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = kMAKESCHOOLIMAGE
        return imageView
    }()
    lazy var descriptionLabel: UILabel = {
        let label: UILabel = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.sizeToFit()
        label.numberOfLines = 0
        label.textColor = .white
        label.textAlignment = .center
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
    
//MARK: App Life Cycle
    override func loadView() {
        super.loadView()
        setupViews()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
//MARK: Private Methods
    fileprivate func setupViews() {
        self.navigationController?.initRootViewController(vc: self)
        self.view.backgroundColor = .white
        setupStackView()
        setupImageView()
        setupDescriptionLabel()
        setupLoginButton()
        setupTextFields()
    }
    
    fileprivate func setupStackView() {
        self.view.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.8),
            stackView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.8),
            stackView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 50),
            stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
    }
    
    fileprivate func setupTextFields() {
        stackView.addArrangedSubview(emailTextField)
        stackView.addArrangedSubview(passwordTextField)
        NSLayoutConstraint.activate([
            emailTextField.widthAnchor.constraint(equalTo: stackView.widthAnchor, multiplier: 0.8),
            passwordTextField.widthAnchor.constraint(equalTo: stackView.widthAnchor, multiplier: 0.8)
        ])
    }
    
    fileprivate func setupLoginButton() {
        stackView.addArrangedSubview(loginButton)
        loginButton.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier:  0.8).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
    }
    
    fileprivate func setupDescriptionLabel() {
        stackView.addArrangedSubview(descriptionLabel)
        descriptionLabel.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier:  0.8).isActive = true
    }
    
    fileprivate func setupImageView() {
        stackView.addArrangedSubview(imageView)
        imageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
    }
    
//MARK: Helpers
    @objc func loginButtonTapped() {
        let homeVC: HomeVC = HomeVC()
        self.navigationController?.pushViewController(homeVC, animated: true) //push
    }
}

//MARK: Extensions


