//
//  TabBarController.swift
//  MobileClasswork
//
//  Created by Macbook Pro 15 on 2/21/20.
//  Copyright © 2020 SamuelFolledo. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewControllers()
    }
    
    func setupViewControllers(){        
        let homeVC: HomeVC = HomeVC()
        let newVC: NewBoxVC = NewBoxVC()
        let historyVC: PastBoxesVC = PastBoxesVC()
        let profileVC: ProfileVC = ProfileVC()
        let navArray: [UINavigationController] = [
            UINavigationController(rootViewController: homeVC),
            UINavigationController(rootViewController: newVC),
            UINavigationController(rootViewController: historyVC),
            UINavigationController(rootViewController: profileVC),
            
        ]
        viewControllers = navArray
    }
    
//MARK: Helpers
    
}
