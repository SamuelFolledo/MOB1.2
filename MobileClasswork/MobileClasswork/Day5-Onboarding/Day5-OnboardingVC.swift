//
//  Day5_OnboardingVC.swift
//  MobileClasswork
//
//  Created by Macbook Pro 15 on 2/4/20.
//  Copyright © 2020 SamuelFolledo. All rights reserved.
//

import UIKit

class Day5_OnboardingVC: UIViewController {
    
//MARK: Non-views Properties
    var pages: [OnboardingPageView] = []
    var currentPage: Int { //tell which page is currently being viewed based on the contentOffset of the UIScrollView
        get {
            let page = Int(scrollView.contentOffset.x / view.bounds.size.width)
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
        return scrollView
    }()
    let contentView: UIView = {
        let view: UIView = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        return view
    }()
    var page1View: OnboardingPageView!
    var page2View: OnboardingPageView!
    var page3View: OnboardingPageView!
    var page4View: OnboardingPageView!
    let pageControl: UIPageControl = {
        let pageControl: UIPageControl = UIPageControl(frame: .zero)
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.tintColor = .black
        return pageControl
    }()
    
//MARK: App Lifecycle
    override func loadView() {
        super.loadView()
        setupScrollView()
        setupPageControl()
        setupPageViews()
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
    fileprivate func setupScrollView() { //setup scrollView and contentView
        scrollView.delegate = self //optional
        view.insertSubview(scrollView, at: 0)
        scrollView.insertSubview(contentView, at: 1)
        NSLayoutConstraint.activate(
            scrollView.frameLayoutGuide.pinToEdges(view: self.view) //pin scrollView's frameLayoutGuide to the edges of self.view
        )
        NSLayoutConstraint.activate(
            scrollView.contentLayoutGuide.pinToEdges(view: contentView) //pin scrollView's contentLayoutGuide to edges of contentView
        )
        scrollView.contentLayoutGuide.heightAnchor.constraint(equalTo: scrollView.frameLayoutGuide.heightAnchor).isActive = true //NOTE: you can get width and height from scrollView's frameLayoutGuide, and you can pin top, left, right, and bottom to scrollView's contentLayoutGuide //refer to Adriana's ScrollView Recipe
    }
    
    fileprivate func setupPageViews() {
        page1View = OnboardingPageView(color: .orange, pageImage: kMAKESCHOOLIMAGE, description: "PAGE 1!")
        page2View = OnboardingPageView(color: .systemPink, pageImage: kMAKESCHOOLIMAGE, description: "PAGE 2!!")
        page3View = OnboardingPageView(color: .blue, pageImage: kMAKESCHOOLIMAGE, description: "PAGE 3!!!")
        page4View = OnboardingPageView(color: .purple, pageImage: kMAKESCHOOLIMAGE, description: "PAGE 4!!!!", isLastPage: true)
        pages.append(contentsOf: [page1View, page2View, page3View, page4View])
        applyPageConstraints()
    }
    
    fileprivate func applyPageConstraints() { //apply constraints to all pages
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
                page.continueButton.addTarget(self, action: #selector(continueButtonTapped), for: .touchUpInside)
            }
        }
    }
    
    fileprivate func setupPageControl() {
        self.view.addSubview(pageControl) //must put to self.view so it won't disappear
        NSLayoutConstraint.activate([ //isActive = true a group of contraints
            pageControl.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/4),
            pageControl.heightAnchor.constraint(equalToConstant: 50),
            pageControl.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -25),
            pageControl.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor),
        ])
        pageControl.addTarget(self, action: #selector(self.pageControlDidTouch), for: .touchUpInside)
    }
    
//MARK: Helpers
    @objc func continueButtonTapped() {
        print("EYOOO")
//        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
//        let nextViewController = storyBoard.instantiateViewControllerWithIdentifier("nextView") as NextViewController
//        self.presentViewController(nextViewController, animated:true, completion:nil)
        let loginVC: HomeVC = HomeVC()
//        loginVC.push
        self.present(loginVC, animated: true, completion: nil)
    }
}

extension Day5_OnboardingVC: UIScrollViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        pageControl.currentPage = currentPage
    }
    
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        pageControl.currentPage = currentPage
    }
}

//MARK: Helper Methods
extension Day5_OnboardingVC {
    fileprivate func nextPage() {
        if currentPage + 1 < self.numberOfPages {
            navigateToPage(page: currentPage + 1)
        }
    }
    
    fileprivate func previousPage() {
        if currentPage > 0 {
            navigateToPage(page: currentPage - 1)
        }
    }
    
    @objc func pageControlDidTouch() { //method to change page when user interacts with pageControl {
        navigateToPage(page: pageControl.currentPage)
    }
    
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

