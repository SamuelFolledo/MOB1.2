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
    let alienArray = [String](repeating: "👽 invading  🌎", count: 100)
    
//MARK: Properties Views
    let table: UITableView = {
       let table = UITableView()
       table.translatesAutoresizingMaskIntoConstraints = false
       table.rowHeight = 75
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
        self.title = "Past Boxes"
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
        table.register(BoxCell.self, forCellReuseIdentifier: "boxCell")
        table.tableFooterView = UIView()
    }
    
//MARK: Helpers
    
}

//MARK: Extensions
extension PastBoxesVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Cell's row = ", indexPath.row)
        let vc = PastBoxesDetailVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension PastBoxesVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return alienArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: BoxCell = tableView.dequeueReusableCell(withIdentifier: "boxCell", for: indexPath) as! BoxCell
//        let cell = tableView.dequeueReusableCell(withIdentifier: "boxCell", for: indexPath)
//        cell.textLabel?.text = "\(indexPath.row) \(alienArray[indexPath.row])"
        cell.accessoryType = .disclosureIndicator
        cell.selectionStyle = .none
        return cell
    }
}
