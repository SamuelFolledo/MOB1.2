//
//  OnboardingVC.swift
//  MobileClasswork
//
//  Created by Macbook Pro 15 on 1/28/20.
//  Copyright © 2020 SamuelFolledo. All rights reserved.
//

import UIKit

class OnboardingVC: UIViewController {
    
    var scrollView: UIScrollView!
    var page1View: UIView!
    var page2View: UIView!
    var page3View: UIView!
    
    override func loadView() {
        super.loadView()
        setupScrollView()
        setupPage1()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func setupScrollView() {
        scrollView = UIScrollView(frame: .zero)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(scrollView)
        NSLayoutConstraint.activate([ //isActive = true a group of contraints
            scrollView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1/1),
            scrollView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 1/1),
            scrollView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            scrollView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
        ])
    }
    
    func setupPage1() {
        page1View = UIView(frame: .zero)
        page1View.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(page1View)
        NSLayoutConstraint.activate([ //isActive = true a group of contraints
            page1View.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1/1),
            page1View.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 1/1),
            page1View.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            page1View.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
        ])
        self.page1View.backgroundColor = .orange
    }
    
    func setupPage2() {
        page2View = UIView(frame: .zero)
        page2View.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(page2View)
        NSLayoutConstraint.activate([ //isActive = true a group of contraints
            page2View.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1/1),
            page2View.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 1/1),
            page2View.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            page2View.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
        ])
        self.page2View.backgroundColor = .systemPink
    }
    
    func setupPage3() {
        page3View = UIView(frame: .zero)
        page3View.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(page3View)
        NSLayoutConstraint.activate([ //isActive = true a group of contraints
            page3View.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1/1),
            page3View.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 1/1),
            page3View.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            page3View.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
        ])
        self.page3View.backgroundColor = .blue
    }

}
