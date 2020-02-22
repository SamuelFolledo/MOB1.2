//
//  TabBarController.swift
//  MobileClasswork
//
//  Created by Macbook Pro 15 on 2/21/20.
//  Copyright © 2020 SamuelFolledo. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    
///tabbar item bounce animation
    private var bounceAnimation: CAKeyframeAnimation = {
        let bounceAnimation = CAKeyframeAnimation(keyPath: "transform.scale")
        bounceAnimation.values = [1.0, 1.4, 0.9, 1.02, 1.0]
        bounceAnimation.duration = TimeInterval(0.5)
        bounceAnimation.calculationMode = CAAnimationCalculationMode.cubic
        return bounceAnimation
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }
    
    fileprivate func setupTabBar() {
        self.delegate = self
        self.tabBar.isTranslucent = false
        setupViewControllers()
    }
    
    fileprivate func setupViewControllers(){
        let homeNav = UINavigationController(rootViewController: HomeVC())
        homeNav.tabBarItem = UITabBarItem(title: "Home", image: kHOMEIMAGE, tag: 0)
        let newNav = UINavigationController(rootViewController: NewBoxVC())
        newNav.tabBarItem = UITabBarItem(title: "New Box", image: kNEWIMAGE, tag: 1)
        let historyNav = UINavigationController(rootViewController: PastBoxesVC())
        historyNav.tabBarItem = UITabBarItem(title: "History", image: kHISTORYIMAGE, tag: 2)
        let profileNav = UINavigationController(rootViewController: ProfileVC())
        let navArray: [UINavigationController] = [ homeNav, newNav, historyNav, profileNav]
        profileNav.tabBarItem = UITabBarItem(title: "Profile", image: kPROFILEIMAGE, tag: 3)
        viewControllers = navArray
    }
    
//MARK: Helpers
}

extension TabBarController: UITabBarControllerDelegate {
///Adds a left or right sliding VC animation on tabbar tap
    func tabBarController(_ tabBarController: UITabBarController, animationControllerForTransitionFrom fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        var fromIndex = 0
        for vc in viewControllers! { //get the index of current index before transitioning
            if vc == fromVC {
                break
            }
            fromIndex += 1
        }
        return TransitioningObject(tabBarController: tabBarController, fromIndex: fromIndex)
    }
    
/// tabbar item bounce animation
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        // find index if the selected tab bar item, then find the corresponding view and get its image, the view position is offset by 1 because the first item is the background (at least in this case)
        guard let idx = tabBar.items?.firstIndex(of: item), tabBar.subviews.count > idx + 1, let imageView = tabBar.subviews[idx + 1].subviews.compactMap ({ $0 as? UIImageView }).first else {
            return
        }
        // animate the imageView
        imageView.layer.add(bounceAnimation, forKey: nil)
    }
}
