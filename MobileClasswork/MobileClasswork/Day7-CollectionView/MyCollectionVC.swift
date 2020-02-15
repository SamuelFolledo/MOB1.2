//
//  MyCollectionVC.swift
//  MobileClasswork
//
//  Created by Macbook Pro 15 on 2/11/20.
//  Copyright © 2020 SamuelFolledo. All rights reserved.
//

import UIKit

class MyCollectionVC: UIViewController {
    
    let flow = MyFlowLayout()
    lazy var collectionView: UICollectionView = { //lazy so you can declare self as delegate and datasource
        let collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.alwaysBounceVertical = true
        collectionView.backgroundColor = .white
        collectionView.register(MyCollectionViewCell.self, forCellWithReuseIdentifier: MyCollectionViewCell.identifier)
        collectionView.collectionViewLayout = flow
        return collectionView
    }()
    var data: [String] = Array(repeating: "🦕", count: 10)
    
    override func loadView() {
        super.loadView()
        view.addSubview(collectionView)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Update", style: .done, target: self, action: #selector(showOptions(controller:)))
    }
    
    @objc func showOptions(controller: UIViewController) { //MARK: Tip: Delete updates first, in descending order. And Insert updates last, in ascending order
        let alert = UIAlertController(title: "Options", message: "Choose an update", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Example", style: .default, handler: { (_) in
            self.collectionView.performBatchUpdates({ //Animates multiple insert, delete, reload, and move operations as a group.
                self.data[3] = "😦" //change the item at 3
                let updated = self.data[3] //store it
                self.data.remove(at: 3) //remove then insert
                self.data.insert(updated, at: 0)
                self.collectionView.deleteItems(at: [IndexPath(item: 3, section: 0)])
                self.collectionView.insertItems(at: [IndexPath(item: 0, section: 0)])
            }, completion: nil)
        }))
        alert.addAction(UIAlertAction(title: "Insert 3 emojis at the beginning", style: .default, handler: { (_) in //this does not need batchUpdate
            self.collectionView.performBatchUpdates({
                self.data.insert(contentsOf: ["😦","😦","😦"], at: 0)
                self.collectionView.insertItems(at: [IndexPath(item: 0, section: 0), IndexPath(item: 1, section: 0), IndexPath(item: 2, section: 0)]) //insertItem one at a time
            }, completion: nil)
        }))
        alert.addAction(UIAlertAction(title: "Update item at 5 with an emoji", style: .default, handler: { (_) in
            self.collectionView.performBatchUpdates({ //Animates multiple insert, delete, reload, and move operations as a group.
                self.data[5] = "😦" //this just updates the data
                self.collectionView.deleteItems(at: [IndexPath(item: 5, section: 0)])
                self.collectionView.insertItems(at: [IndexPath(item: 5, section: 0)])
            }, completion: nil)
        }))
        alert.addAction(UIAlertAction(title: "Delete first 2 items, insert 3 items at the end", style: .default, handler: { (_) in
            self.collectionView.performBatchUpdates({
                self.data.remove(at: 0)
                self.data.remove(at: 0)
                self.data.insert(contentsOf: ["😦","😦","😦"], at: self.data.count)
                self.collectionView.deleteItems(at: [IndexPath(item: 0, section: 0), IndexPath(item: 1, section: 0)])
                self.collectionView.insertItems(at: [IndexPath(item: 0, section: 0)])
            }, completion: nil)
        }))
        alert.addAction(UIAlertAction(title: "Delete first 3, insert 1 item at the beginning", style: .default, handler: { (_) in
            self.collectionView.performBatchUpdates({
                self.data.remove(at: 0)
                self.data.remove(at: 0)
                self.data.remove(at: 0)
                self.data.insert("😦", at: 0)
                self.collectionView.deleteItems(at: [IndexPath(item: 0, section: 0), IndexPath(item: 1, section: 0), IndexPath(item: 1, section: 0)])
                self.collectionView.insertItems(at: [IndexPath(item: 0, section: 0)])
                
            }, completion: nil)
        }))
        alert.addAction(UIAlertAction(title: "Reset", style: .default, handler: { (_) in
            self.data = Array(repeating: "🦕", count: 10)
            self.collectionView.reloadData()
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (_) in
        }))
        self.present(alert, animated: true, completion:nil)
    }
}


extension MyCollectionVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return self.data.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCell.identifier, for: indexPath) as! MyCollectionViewCell
        let data = self.data[indexPath.item]
        cell.textLabel.text = "\(data) : \(indexPath.row)"
        cell.textLabel.textColor = UIColor.white
        return cell
    }
}

extension MyCollectionVC: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}

//extension MyCollectionVC: UICollectionViewDelegateFlowLayout {
//
//    func collectionView(_ collectionView: UICollectionView,
//                        layout collectionViewLayout: UICollectionViewLayout,
//                        sizeForItemAt indexPath: IndexPath) -> CGSize { //size of the cells
//        return CGSize(width: 75, height: 75)
//    }
//
//    func collectionView(_ collectionView: UICollectionView,
//                        layout collectionViewLayout: UICollectionViewLayout,
//                        insetForSectionAt section: Int) -> UIEdgeInsets { //space between cells and the edge of collectionView
//        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
//    }
//
//    func collectionView(_ collectionView: UICollectionView,
//                        layout collectionViewLayout: UICollectionViewLayout,
//                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat { //if collectionView is vertical, then this is the spacing between cells horizontally
//        return 20
//    }
//
//    func collectionView(_ collectionView: UICollectionView,
//                        layout collectionViewLayout: UICollectionViewLayout,
//                        minimumLineSpacingForSectionAt section: Int) -> CGFloat { //spacing between cells vertically
//        return 20
//    }
//
//}

