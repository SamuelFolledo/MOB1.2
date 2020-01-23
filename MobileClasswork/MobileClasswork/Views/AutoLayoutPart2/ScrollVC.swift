//
//  ScrollVC.swift
//  MobileClasswork
//
//  Created by Macbook Pro 15 on 1/23/20.
//  Copyright © 2020 SamuelFolledo. All rights reserved.
//

import UIKit

class ScrollVC: UIViewController {
    
    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var imageView2: UIImageView!
    @IBOutlet weak var bottomView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .red
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
