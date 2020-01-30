//
//  OnboardingVC.swift
//  MobileClasswork
//
//  Created by Macbook Pro 15 on 1/28/20.
//  Copyright © 2020 SamuelFolledo. All rights reserved.
//

import UIKit

class OnboardingVC: UIViewController {
    
//MARK: Non-views Properties
    var pages: [UIView] = []
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
    
//MARK: Views Properties
    let scrollView: UIScrollView = {
        let scrollView: UIScrollView = UIScrollView(frame: .zero)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.isPagingEnabled = true
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    let contentView: UIView = {
        let view: UIView = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .purple
        return view
    }()
    let page1View: UIView = {
        let view: UIView = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .orange
        return view
    }()
    let page2View: UIView = {
        let view: UIView = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemPink
        return view
    }()
    let page3View: UIView = {
        let view: UIView = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .blue
        return view
    }()
    let pageControl: UIPageControl = {
        let pageControl: UIPageControl = UIPageControl(frame: .zero)
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.tintColor = .black
        return pageControl
    }()
    let page1ImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "makeschoolLogo")!)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "EYOOOO"
        label.font = .boldSystemFont(ofSize: 18)
        label.textAlignment = .center
        return label
    }()
    
//MARK: App Lifecycle
    override func loadView() {
        super.loadView()
        setupScrollView()
        updateViews()
        setupPageControl()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
      pageControl.numberOfPages = self.numberOfPages
      pageControl.currentPage = 0
    }
    
//MARKA: Private methods
    fileprivate func setupScrollView() { //and contentView
        view.insertSubview(scrollView, at: 0)
        scrollView.insertSubview(contentView, at: 1)
        NSLayoutConstraint.activate(
            scrollView.frameLayoutGuide.pinToEdges(view: self.view) //pin scrollView's frameLayoutGuide to edges of self.view
        )
        
        NSLayoutConstraint.activate(
            scrollView.contentLayoutGuide.pinToEdges(view: contentView)
        ) //pin scrollView's contentLayoutGuide to edges of self.view
        scrollView.contentLayoutGuide.heightAnchor.constraint(equalTo: scrollView.frameLayoutGuide.heightAnchor).isActive = true
        scrollView.delegate = self
    }
    
    fileprivate func updateViews() {
        pages.append(contentsOf: [page1View, page2View, page3View])
        setupConstraints()
    }
    
    fileprivate func setupConstraints() {
        pages.enumerated().forEach { tuple in //this tuple only have offset and element
            let index = tuple.offset //index of page
            let page = tuple.element //page
            contentView.addSubview(page) //add page to contentView
            NSLayoutConstraint.activate([ //set page's top, bottom and width
                page.topAnchor.constraint(equalTo: scrollView.topAnchor),
                page.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
                page.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
            ])
            if index == 0 { //if first page, then set page's leftAnchor to contentView's leftAnchor
                NSLayoutConstraint.activate([
                    page.leftAnchor.constraint(equalTo: contentView.leftAnchor)
                ])
            } else { //else set current page's leftAnchor to the previous page's rightAnchor
                NSLayoutConstraint.activate([
                    page.leftAnchor.constraint(equalTo: pages[index - 1].rightAnchor)
                ])
            }
            if index == pages.count - 1 { //if last page, then set that page's rightAnchor to contentView's rightAnchor
                NSLayoutConstraint.activate([
                    page.rightAnchor.constraint(equalTo: contentView.rightAnchor)
                ])
            }
        }
    }
    
    fileprivate func setupPageControl() {
        contentView.insertSubview(pageControl, at: 100) //put it in the front
        NSLayoutConstraint.activate([ //isActive = true a group of contraints
            pageControl.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 1/4),
            pageControl.heightAnchor.constraint(equalToConstant: 50),
            pageControl.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: self.view.frame.height - 25),
            pageControl.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor),
        ])
        pageControl.addTarget(self, action: #selector(self.pageControlDidTouch), for: .touchUpInside)
    }
    
    fileprivate func setupPage1() {
        scrollView.addSubview(page1View)
        NSLayoutConstraint.activate([ //isActive = true a group of contraints
            page1View.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1/1),
            page1View.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 1/1),
            page1View.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            page1View.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
        ])
        pages.append(page1View)
        setupImageView()
        setupDescriptionLabel()
    }
    
    fileprivate func setupDescriptionLabel() {
        page1View.addSubview(descriptionLabel)
        descriptionLabel.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 4/5).isActive = true
        descriptionLabel.heightAnchor.constraint(equalToConstant: 200).isActive = true
        descriptionLabel.topAnchor.constraint(equalTo: page1ImageView.bottomAnchor, constant: 100).isActive = true
        descriptionLabel.centerXAnchor.constraint(equalTo: page1ImageView.centerXAnchor).isActive = true
    }
    
    fileprivate func setupImageView() {
        page1View.addSubview(page1ImageView)
        page1ImageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        page1ImageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        page1ImageView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100).isActive = true
        page1ImageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
    }
    
    fileprivate func setupPage2() {
        scrollView.addSubview(page2View)
        NSLayoutConstraint.activate([ //isActive = true a group of contraints
            page2View.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1/1),
            page2View.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 1/1),
            page2View.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            page2View.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
        ])
        pages.append(page2View)
    }
    
    fileprivate func setupPage3() {
        scrollView.addSubview(page3View)
        NSLayoutConstraint.activate([ //isActive = true a group of contraints
            page3View.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1/1),
            page3View.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 1/1),
            page3View.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            page3View.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
        ])
        pages.append(page3View)
    }
}

extension OnboardingVC: UIScrollViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        pageControl.currentPage = currentPage
    }
    
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        pageControl.currentPage = currentPage
    }
}

//MARK: Helper Methods
extension OnboardingVC {
    fileprivate func nextPage() {
        if currentPage + 1 < self.numberOfPages {
//            delegate?.nextButtonPressed?()
            navigateToPage(page: currentPage + 1)
        }
    }
    
    fileprivate func previousPage() {
        if currentPage > 0 {
//            delegate?.previousButtonPressed?()
            navigateToPage(page: currentPage - 1)
        }
    }
    
    @objc func pageControlDidTouch() { //method to change page when user interacts with pageControl {
        navigateToPage(page: pageControl.currentPage)
    }
    
//    func addViewController(page: UIView) -> Void {
////        controllers.append(vc)
//        pages.append(page)
//
//        page.translatesAutoresizingMaskIntoConstraints = false
//        scrollView.addSubview(page)
//
//        let metrics = ["w":vc.view.bounds.size.width,"h":vc.view.bounds.size.height]
//        vc.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:[view(h)]", options:[], metrics: metrics, views: ["view":page]))
//        vc.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:[view(w)]", options:[], metrics: metrics, views: ["view":page]))
//        scrollView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-0-[view]|", options:[], metrics: nil, views: ["view":page,]))
//
//        if self.numberOfPages == 1 {
//            scrollView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-0-[view]", options:[], metrics: nil, views: ["view":page,]))
//        } else {
//            let previousVC = controllers[self.numberOfPages - 2]
//            let previousView = previousVC.view;
//
//            scrollView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:[previousView]-0-[view]", options:[], metrics: nil, views: ["previousView":previousView,"view":vc.view]))
//
//            if let cst = lastViewConstraint{
//                scrollView.removeConstraints(cst as! [NSLayoutConstraint])
//            }
//            lastViewConstraint = NSLayoutConstraint.constraintsWithVisualFormat("H:[view]-0-|", options:[], metrics: nil, views: ["view":vc.view])
//            scrollView.addConstraints(lastViewConstraint! as! [NSLayoutConstraint])
//        }
//    }
    
    private func updateUI() {
        pageControl.currentPage = currentPage
    }
    
    private func navigateToPage(page: Int) {
        if page < self.numberOfPages {
            var frame = scrollView.frame
            frame.origin.x = CGFloat(page) * frame.size.width
            scrollView.scrollRectToVisible(frame, animated: true)
        }
    }
    
}
