//
//  HomeVC.swift
//  MobileClasswork
//
//  Created by Macbook Pro 15 on 2/6/20.
//  Copyright © 2020 SamuelFolledo. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {
//MARK: Properties
    lazy var sections: [Section] = [
        TitleSection(title: "Featured Boxes"),
        FeaturedSection(),
        TitleSection(title: "Favorite Boxes"),
        FavoritesSection()
    ]
//MARK: Properties Views
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView.init(frame: .zero, collectionViewLayout: collectionViewLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = UIColor.white
        collectionView.register(UINib(nibName: "TitleCell", bundle: .main), forCellWithReuseIdentifier: TitleCell.identifier)
        collectionView.register(UINib(nibName: "FeaturedCell", bundle: .main), forCellWithReuseIdentifier: FeaturedCell.identifier)
        collectionView.register(UINib(nibName: "FavoritesCell", bundle: .main), forCellWithReuseIdentifier: FavoritesCell.identifier)
        return collectionView
    }()
    lazy var collectionViewLayout: UICollectionViewLayout = {
        var sections = self.sections
        let layout = UICollectionViewCompositionalLayout { (sectionIndex, environment) -> NSCollectionLayoutSection? in
            return sections[sectionIndex].layoutSection()
        }
        return layout
    }()
    lazy var settingsButton: UIBarButtonItem = {
        let barButton: UIBarButtonItem = UIBarButtonItem()
        return barButton
    }()
    
//MARK: App Life Cycle
    override func loadView() {
        super.loadView()
        title = "Home"
        setupViews()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationBar()
        updateColors()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        updateColors()
    }
    
//MARK: Private Methods
    fileprivate func updateColors() {
        view.backgroundColor = SettingsService.whiteColor
        self.tabBarController?.isMainTabBar()
        collectionView.backgroundColor = SettingsService.whiteColor
        collectionView.reloadData()
    }
    
    fileprivate func setupViews() {
        setupCollectionView()
    }
    
    fileprivate func setupCollectionView() {
        self.view.addSubview(collectionView)
        collectionView.backgroundColor =  SettingsService.whiteColor
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor)
        ])
    }
    
    fileprivate func setupNavigationBar() {
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.tintColor = SettingsService.grayColor //button color
        navigationController?.setStatusBarColor(backgroundColor: kMAINCOLOR)
        settingsButton = UIBarButtonItem.navButton(self, action: #selector(settingsButtonTapped), image: kSETTINGSIMAGE)
        navigationItem.rightBarButtonItem = settingsButton
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
//MARK: Helpers
    @objc func newButtonTapped() {
        let vc: NewBoxVC = NewBoxVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @objc func pastButtonTapped() {
        let vc: PastBoxesVC = PastBoxesVC()
        navigationController?.pushViewController(vc, animated: true) //push
    }
    @objc func profileButtonTapped() {
        let vc: Day8VC = Day8VC()
        navigationController?.pushViewController(vc, animated: true) //push
    }
    @objc func settingsButtonTapped() {
        let vc: PopupVC = PopupVC()
        vc.delegate = self
        vc.modalPresentationStyle = .overFullScreen //fullscreen will have a black background, overFullScreen will be clear
//        navigationController?.pushViewController(vc, animated: false) //push
        navigationController?.present(vc, animated: false, completion: nil)
    }
}

//MARK: Extensions
extension HomeVC: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        sections.count
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        sections[section].numberOfItems
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        sections[indexPath.section].configureCell(collectionView: collectionView, indexPath: indexPath)
    }
}

extension HomeVC: UICollectionViewDelegate {}

extension HomeVC: PopupProtocol {
    func didUpdateColor() {
        updateColors()
    }
}
