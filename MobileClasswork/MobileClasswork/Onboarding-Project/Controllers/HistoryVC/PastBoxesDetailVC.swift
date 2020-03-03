//
//  PastBoxesDetailVC.swift
//  MobileClasswork
//
//  Created by Macbook Pro 15 on 2/11/20.
//  Copyright © 2020 SamuelFolledo. All rights reserved.
//

import UIKit

class PastBoxesDetailVC: UIViewController {
//MARK: Properties
//    var boxes: [(Product, Bool)] = [(Product, Bool)](repeating: (kSAMPLEPRODUCT,false), count: 100)
    var boxes: [(Product, Bool)] = []
    var month: String = ""
    
//MARK: Properties Views
    let table: UITableView = {
       let table = UITableView()
       table.translatesAutoresizingMaskIntoConstraints = false
       table.rowHeight = 100
       return table
    }()
    
//MARK: App Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateColors()
    }
    
//MARK: Private Methods
    fileprivate func updateColors() {
        view.backgroundColor = SettingsService.shared.whiteColor
        table.backgroundColor = SettingsService.shared.whiteColor
        table.reloadData()
    }
    
    fileprivate func setupViews() {
        view.backgroundColor = .white
        title = month
        for product in kSAMPLEPRODUCTS { //populate boxes with default not selected
            boxes.append((product, false))
        }
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
        table.register(BoxDetailCell.self, forCellReuseIdentifier: BoxDetailCell.identifier)
        table.tableFooterView = UIView()
    }
    
//MARK: Helpers
}

//MARK: Extensions
extension PastBoxesDetailVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell: BoxDetailCell = tableView.cellForRow(at: indexPath) as! BoxDetailCell
        cell.starImageView.image = cell.starImageView.image == kSTARIMAGE ? kSTARFILLEDIMAGE : kSTARIMAGE //if star is filled, then unfill it
        boxes[indexPath.row].1 = !boxes[indexPath.row].1
    }
}

extension PastBoxesDetailVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return boxes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: BoxDetailCell = tableView.dequeueReusableCell(withIdentifier: BoxDetailCell.identifier, for: indexPath) as! BoxDetailCell
        //cell.starImageView.image = cell.isFavorite ? kSTARFILLEDIMAGE : kSTARIMAGE
        cell.selectionStyle = .none
        if boxes[indexPath.row].1 { //if true
            cell.starImageView.image = kSTARFILLEDIMAGE
        } else {
            cell.starImageView.image = kSTARIMAGE
        }
        let product = boxes[indexPath.row].0
        cell.boxImageView.image = product.image.tint(with: SettingsService.shared.grayColor) //product's image
        cell.titleLabel.text = product.name
        cell.descriptionLabel.text = product.description
        cell.updateCellColors()
        return cell
    }
}
