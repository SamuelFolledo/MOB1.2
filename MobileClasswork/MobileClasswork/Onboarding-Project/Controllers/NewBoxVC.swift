//
//  NewBoxVC.swift
//  MobileClasswork
//
//  Created by Macbook Pro 15 on 2/12/20.
//  Copyright © 2020 SamuelFolledo. All rights reserved.
//

import UIKit

class NewBoxVC: UIViewController {
    
    let flow = NewBoxCellFlowLayout()
    
    lazy var collectionView: UICollectionView = {
        // Instantiating the UICollectionView, using the default flow layout
        let collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.alwaysBounceVertical = true
        collectionView.backgroundColor = .white
        collectionView.register(NewBoxCell.self, forCellWithReuseIdentifier: NewBoxCell.identifier)
        collectionView.collectionViewLayout = flow
        return collectionView
    }()
    
    lazy var settingsButton: UIBarButtonItem = {
        let barButton: UIBarButtonItem = UIBarButtonItem()
        return barButton
    }()
        
//    var data: [String] = Array(repeating: "🦕", count: 10)
    var data: [Product] = []
    
//MARK: App Life Cycle
    override func loadView() {
        super.loadView()
        title = "New Box"
        view.addSubview(collectionView)
//        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Update", style: .done, target: self, action: #selector(showOptions(controller:)))
        setupNavigationBar()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populateData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationBar()
        updateColors()
    }
    
//MARK: Private Methods
    fileprivate func updateColors() {
        view.backgroundColor = SettingsService.whiteColor
        collectionView.backgroundColor = SettingsService.whiteColor
        self.tabBarController?.isMainTabBar()
    }
    
    fileprivate func populateData() {
        data.removeAll()
        data = kSAMPLEPRODUCTS
        data.shuffle()
    }
    
    fileprivate func setupNavigationBar() {
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.tintColor = SettingsService.grayColor //button color
        navigationController?.setStatusBarColor(backgroundColor: kMAINCOLOR)
        settingsButton = UIBarButtonItem.navButton(self, action: #selector(settingsButtonTapped), image: kSETTINGSIMAGE)
        navigationItem.rightBarButtonItem = settingsButton
    }
    
//MARK: Helpers
    @objc func showOptions(controller: UIViewController) {
        let advil = kSAMPLEPRODUCT
        let alert = UIAlertController(title: "Options", message: "Choose an update", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Example", style: .default, handler: { (_) in
            self.collectionView.performBatchUpdates({ //Animates multiple insert, delete, reload, and move operations as a group.
                self.data[3] = advil //change the item at 3
                let updated = self.data[3] //store it
                self.data.remove(at: 3) //remove then insert
                self.data.insert(updated, at: 0)
                self.collectionView.deleteItems(at: [IndexPath(item: 3, section: 0)])
                self.collectionView.insertItems(at: [IndexPath(item: 0, section: 0)])
            }, completion: nil)
            
        }))
        
        alert.addAction(UIAlertAction(title: "Insert 3 emojis at the beginning", style: .default, handler: { (_) in
            self.data.insert(contentsOf: [advil, advil, advil], at: 0)
            self.collectionView.insertItems(at: [IndexPath(item: 0, section: 0), IndexPath(item: 1, section: 0), IndexPath(item: 2, section: 0)]) //insertItem one at a time
        }))
        
        alert.addAction(UIAlertAction(title: "Update item at 5 with an emoji", style: .default, handler: { (_) in
            self.data[5] = advil
            let updated = self.data[5]
            self.data.remove(at: 5)
            self.data.insert(updated, at: 5)
            self.collectionView.deleteItems(at: [IndexPath(item: 5, section: 0)])
            self.collectionView.insertItems(at: [IndexPath(item: 5, section: 0)])
        }))
        
        alert.addAction(UIAlertAction(title: "Delete first 2 items, insert 3 items at the end", style: .default, handler: { (_) in
        }))
        
        alert.addAction(UIAlertAction(title: "Delete first 3, insert 1 item at the beginning", style: .default, handler: { (_) in
        }))
        
        alert.addAction(UIAlertAction(title: "Delete first 3 items, insert 1 item at end", style: .default, handler: { (_) in
        }))
        
        alert.addAction(UIAlertAction(title: "Reset", style: .default, handler: { (_) in
//            self.data = Array(repeating: "🦕", count: 10)
            self.populateData()
            self.collectionView.reloadData()
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (_) in
        }))
        
        self.present(alert, animated: true, completion:nil)
    }
    
    @objc func settingsButtonTapped() {
        let vc: PopupVC = PopupVC()
        vc.modalPresentationStyle = .overFullScreen //fullscreen will have a black background, overFullScreen can have a clear
        //        navigationController?.pushViewController(vc, animated: false) //push
        navigationController?.present(vc, animated: false, completion: nil)
    }
}


extension NewBoxVC: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return self.data.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NewBoxCell.identifier, for: indexPath) as! NewBoxCell
        let data = self.data[indexPath.item]
        cell.imageView.image = data.image.withTintColor(SettingsService.grayColor)
        cell.textLabel.text = data.name
        cell.textLabel.textColor = SettingsService.grayColor
        cell.containerView.backgroundColor = .darkGray
        return cell
    }
}

extension NewBoxVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
        let cell: NewBoxCell = collectionView.cellForItem(at: indexPath) as! NewBoxCell
        cell.containerView.backgroundColor = .purple
//        cell.starImageView.image = cell.starImageView.image == kSTARIMAGE ? kSTARFILLEDIMAGE : kSTARIMAGE //if star is filled, then unfill it
//        boxes[indexPath.row].1 = !boxes[indexPath.row].1
    }
}

