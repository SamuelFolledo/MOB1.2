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
    var pageControl: UIPageControl!
    var pages:[UIView]!
    var currentPage: Int { //tell which page is currently being viewed based on the contentOffset of the UIScrollView
      get {
        let page = Int((scrollView.contentOffset.x / view.bounds.size.width))
        print("PAGE = \(page)")
        return page
      }
    }
    var numberOfPages: Int {
      get {
        return self.pages.count
      }
    }
    
//MARK: App Lifecycle
    override func loadView() {
        super.loadView()
        setupScrollView()
        setupPageControl()
        setupPage1()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
//MARKA: Private methods
    fileprivate func setupScrollView() {
        scrollView = UIScrollView(frame: .zero)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.insertSubview(scrollView, at: 0)
        NSLayoutConstraint.activate([ //isActive = true a group of contraints
            scrollView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1/1),
            scrollView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 1/1),
            scrollView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            scrollView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
        ])
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.isPagingEnabled = true
        scrollView.delegate = self
        scrollView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    fileprivate func setupPageControl() {
        pages = Array()
        pageControl = UIPageControl(frame: .zero)
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        scrollView.insertSubview(pageControl, at: 100) //put it in the front
        NSLayoutConstraint.activate([ //isActive = true a group of contraints
            pageControl.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor, multiplier: 1/4),
            pageControl.heightAnchor.constraint(equalToConstant: 50),
            pageControl.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor, constant: 50),
            pageControl.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor),
        ])
        pageControl?.addTarget(self, action: #selector(self.pageControlDidTouch), for: .touchUpInside)
    }
    
    fileprivate func setupPage1() {
        page1View = UIView(frame: .zero)
        page1View.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(page1View)
        NSLayoutConstraint.activate([ //isActive = true a group of contraints
            page1View.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1/1),
            page1View.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 1/1),
            page1View.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            page1View.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
        ])
        page1View.backgroundColor = .orange
        pages.append(page1View)
    }
    
    fileprivate func setupPage2() {
        page2View = UIView(frame: .zero)
        page2View.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(page2View)
        NSLayoutConstraint.activate([ //isActive = true a group of contraints
            page2View.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1/1),
            page2View.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 1/1),
            page2View.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            page2View.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
        ])
        page2View.backgroundColor = .systemPink
        pages.append(page2View)
    }
    
    fileprivate func setupPage3() {
        page3View = UIView(frame: .zero)
        page3View.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(page3View)
        NSLayoutConstraint.activate([ //isActive = true a group of contraints
            page3View.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1/1),
            page3View.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 1/1),
            page3View.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            page3View.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
        ])
        page3View.backgroundColor = .blue
        pages.append(page3View)
    }

//MARK: Helpers
    @objc func pageControlDidTouch() { //method to change page when user interacts with pageControl
        
    }
}

extension OnboardingVC: UIScrollViewDelegate {
    
}
