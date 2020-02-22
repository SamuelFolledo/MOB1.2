//
//  TabBarController.swift
//  MobileClasswork
//
//  Created by Macbook Pro 15 on 2/21/20.
//  Copyright © 2020 SamuelFolledo. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    ///bounce animation on tabbar item
    private var bounceAnimation: CAKeyframeAnimation = {
        let bounceAnimation = CAKeyframeAnimation(keyPath: "transform.scale")
        bounceAnimation.values = [1.0, 1.4, 0.9, 1.02, 1.0]
        bounceAnimation.duration = TimeInterval(0.3)
        bounceAnimation.calculationMode = CAAnimationCalculationMode.cubic
        return bounceAnimation
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewControllers()
    }
    
    func setupViewControllers(){
        let homeNav = UINavigationController(rootViewController: HomeVC())
//        homeNav.tabBarItem
        let newNav = UINavigationController(rootViewController: NewBoxVC())
        let historyNav = UINavigationController(rootViewController: PastBoxesVC())
        let profileNav = UINavigationController(rootViewController: ProfileVC())
        let navArray: [UINavigationController] = [ homeNav, newNav, historyNav, profileNav]
        viewControllers = navArray
    }
    
    /// didSelect that can trigger animation
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        // find index if the selected tab bar item, then find the corresponding view and get its image, the view position is offset by 1 because the first item is the background (at least in this case)
        guard let idx = tabBar.items?.firstIndex(of: item), tabBar.subviews.count > idx + 1, let imageView = tabBar.subviews[idx + 1].subviews.compactMap ({ $0 as? UIImageView }).first else {
            return
        }
        // animate the imageView
        imageView.layer.add(bounceAnimation, forKey: nil)
    }
    
//MARK: Helpers
    
}
