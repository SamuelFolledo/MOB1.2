//
//  TitleSection.swift
//  MobileClasswork
//
//  Created by Macbook Pro 15 on 2/15/20.
//  Copyright © 2020 SamuelFolledo. All rights reserved.
//

import UIKit

struct TitleSection: Section {
    
    // TODO: Set a constant numberOfItems to 1
    let numberOfItems: Int = 1
    
    // TODO: create a constant for the title of the header of type String
    let title: String
    
    // TODO: create an initializer to set the title
    func layoutSection() -> NSCollectionLayoutSection? {
        // TODO: Step 1: Create an item size. Make it full width and height.
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        
        // TODO: Step 2: Create an item and give it the item size we already have.
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        // TODO: Step 3: Create the size of the group. Set it to the full width and make the height 70.
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(70)) //use absolute if you want a specific number
        
        // TODO: Step 4: Pass the group size and item to the group.
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        // TODO: Step 5: Pass the group to the section.
        let section = NSCollectionLayoutSection(group: group)
        
        return section
    }
    
    //Step 6
    func configureCell(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: TitleCell.self), for: indexPath) as! TitleCell
        //TODO: set the cell's title
        cell.set(title: title)
        return cell
    }
}
