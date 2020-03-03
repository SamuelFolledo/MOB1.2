//
//  Section.swift
//  MobileClasswork
//
//  Created by Macbook Pro 15 on 2/15/20.
//  Copyright © 2020 SamuelFolledo. All rights reserved.
//

import UIKit

protocol Section {
    var products: [Product] { get }
    var numberOfItems: Int { get }
    func layoutSection() -> NSCollectionLayoutSection?
    func configureCell(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell
}
