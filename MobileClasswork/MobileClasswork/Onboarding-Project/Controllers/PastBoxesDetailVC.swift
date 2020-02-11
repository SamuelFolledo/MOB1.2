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
    let alienArray = [String](repeating: "👽 invading  🌎", count: 100)
    
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
    
//MARK: Private Methods
    fileprivate func setupViews() {
        view.backgroundColor = .white
        setupTableView()
    }
    
    func setupTableView(){
        table.delegate = self
        table.dataSource = self
        self.view.addSubview(table)
        table.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor).isActive = true
        table.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor).isActive = true
        table.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor).isActive = true
        table.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor).isActive = true
        table.register(BoxDetailCell.self, forCellReuseIdentifier: "boxDetailCell")
        table.tableFooterView = UIView()
    }
    
//MARK: Helpers
    
}

//MARK: Extensions
extension PastBoxesDetailVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}

extension PastBoxesDetailVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return alienArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: BoxDetailCell = tableView.dequeueReusableCell(withIdentifier: "boxDetailCell", for: indexPath) as! BoxDetailCell
        cell.selectionStyle = .none
        return cell
    }
}