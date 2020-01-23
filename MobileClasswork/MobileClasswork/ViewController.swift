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
//        self.view.backgroundColor = .blue
        // Do any additional setup after loading
        
    }
    
    fileprivate func setupScrollView() {
        scrollView.delegate = self
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
    }
    
}

