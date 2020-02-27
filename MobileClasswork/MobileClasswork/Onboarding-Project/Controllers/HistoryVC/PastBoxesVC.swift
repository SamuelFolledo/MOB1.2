//
//  PastBoxesVC.swift
//  MobileClasswork
//
//  Created by Macbook Pro 15 on 2/6/20.
//  Copyright © 2020 SamuelFolledo. All rights reserved.
//

import UIKit

class PastBoxesVC: UIViewController {
//MARK: Properties
//    let alienArray = [String](repeating: "👽 invading  🌎", count: 100)
    let months: [String] = ["February 2020", "January 2020", "December 2019", "November 2019", "October 2019", "September 2019", "August 2019", "July 2019", "June 2019", "May 2019", "April 2019", "March 2019", "February 2019", "January 2019"]
    
//MARK: Properties Views
    let table: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.rowHeight = 100
        table.showsVerticalScrollIndicator = false
        return table
    }()
    
    lazy var settingsButton: UIBarButtonItem = {
        let barButton: UIBarButtonItem = UIBarButtonItem()
        return barButton
    }()
    
//MARK: App Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    override func loadView() {
        super.loadView()
        title = "History"
        setupNavigationBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationBar()
        updateColors()
    }
    
//MARK: Private Methods
    fileprivate func updateColors() {
        view.backgroundColor = SettingsService.whiteColor
        table.backgroundColor = SettingsService.whiteColor
        table.reloadData() //update cell colors
        self.tabBarController?.isMainTabBar()
    }
    
    fileprivate func setupViews() {
        view.backgroundColor = .white
        setupTableView()
    }
    
    fileprivate func setupTableView(){
        table.delegate = self
        table.dataSource = self
        self.view.addSubview(table)
        table.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor).isActive = true
        table.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor).isActive = true
        table.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor).isActive = true
        table.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor).isActive = true
        table.register(BoxCell.self, forCellReuseIdentifier: BoxCell.identifier)
        table.tableFooterView = UIView()
    }
    
    fileprivate func setupNavigationBar() {
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.tintColor = SettingsService.grayColor //button color
        self.navigationItem.largeTitleDisplayMode = .always
        navigationController?.setStatusBarColor(backgroundColor: kMAINCOLOR)
        settingsButton = UIBarButtonItem.navButton(self, action: #selector(settingsButtonTapped), image: kSETTINGSIMAGE)
        navigationItem.rightBarButtonItem = settingsButton
    }
    
//MARK: Helpers
    @objc func settingsButtonTapped() {
        let vc: PopupVC = PopupVC()
        vc.modalPresentationStyle = .overFullScreen
        vc.delegate = self
        navigationController?.present(vc, animated: false, completion: nil)
    }
}

//MARK: Extensions
extension PastBoxesVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = PastBoxesDetailVC()
        vc.month = months[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension PastBoxesVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return months.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: BoxCell = tableView.dequeueReusableCell(withIdentifier: BoxCell.identifier, for: indexPath) as! BoxCell
        cell.boxLabel.text = months[indexPath.row]
        cell.backgroundColor = SettingsService.whiteColor
        cell.boxLabel.textColor = SettingsService.darkGrayColor
        cell.boxImageView.image = kMIGRAINEIMAGE.tint(with: SettingsService.darkGrayColor)
        cell.selectionStyle = .none
        return cell
    }
}

extension PastBoxesVC: PopupProtocol {
    func didUpdateColor(<#name#>: <#type#>) {
        updateColors()
    }
}
