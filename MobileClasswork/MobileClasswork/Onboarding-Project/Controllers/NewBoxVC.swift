//
//  NewBoxVC.swift
//  MobileClasswork
//
//  Created by Macbook Pro 15 on 2/12/20.
//  Copyright © 2020 SamuelFolledo. All rights reserved.
//

import UIKit

class NewBoxVC: UIViewController {
//MARK: Properties
    var data: [Product] = []
    let flow = NewBoxCellFlowLayout()
    
//MARK: Views
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
    
//MARK: App Life Cycle
    override func loadView() {
        super.loadView()
        title = "New Box"
        view.addSubview(collectionView)
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
        view.backgroundColor = SettingsService.shared.whiteColor
        collectionView.backgroundColor = SettingsService.shared.whiteColor
        collectionView.reloadData()
        self.tabBarController?.isMainTabBar()
    }
    
    fileprivate func populateData() {
        data.removeAll()
        data = kSAMPLEPRODUCTS.shuffled()
    }
    
    fileprivate func setupNavigationBar() {
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.tintColor = SettingsService.shared.grayColor //button color
        navigationController?.setStatusBarColor()
        settingsButton = UIBarButtonItem.navButton(self, action: #selector(settingsButtonTapped), image: kSETTINGSIMAGE)
        navigationItem.rightBarButtonItem = settingsButton
    }
    
//MARK: Helpers
    @objc func settingsButtonTapped() {
        let vc: PopupVC = PopupVC()
        vc.modalPresentationStyle = .overFullScreen //fullscreen will have a black background, overFullScreen can have a clear
        vc.delegate = self
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
        cell.imageView.image = data.image.withTintColor(SettingsService.shared.grayColor)
        cell.textLabel.text = data.name
        cell.updateCellColors()
        return cell
    }
}

extension NewBoxVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
        let cell: NewBoxCell = collectionView.cellForItem(at: indexPath) as! NewBoxCell
        cell.containerView.backgroundColor = SettingsService.shared.mainColor
    }
}

extension NewBoxVC: PopupProtocol {
    func didLogout() {
        let vc: LoginVC = LoginVC()
        self.tabBarController?.navigationController?.initRootVC(vc: vc)
    }
    
    func didUpdateColor() {
        updateColors()
    }
}
