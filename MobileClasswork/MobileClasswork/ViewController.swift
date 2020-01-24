//
//  ViewController.swift
//  MobileClasswork
//
//  Created by Macbook Pro 15 on 1/23/20.
//  Copyright © 2020 SamuelFolledo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading
        setupScrollView()
    }
    
    fileprivate func setupScrollView() {
        scrollView.delegate = self
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("REACHED TOP \(scrollView.isAtTop)")
        print("REACHED BOTTOM \(scrollView.isAtBottom)")
        if (scrollView.contentOffset.y >= (scrollView.contentSize.height - scrollView.frame.size.height)) { //reach bottom
//            print("REACH TOP")
        }

        if (scrollView.contentOffset.y <= 0) { //reach top
//            print("REACH BOTTOM")
        }

        if (scrollView.contentOffset.y > 0 && scrollView.contentOffset.y < (scrollView.contentSize.height - scrollView.frame.size.height)){ //not top or bottom
//            print("NOT YET \(scrollView.contentOffset.y)")
        }
    }
}

