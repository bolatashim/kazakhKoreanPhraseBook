//
//  CategoryItemCollectionViewCell.swift
//  finalPhraser
//
//  Created by Bolat Ashim on 8/3/16.
//  Copyright © 2016 Bolat Ashim. All rights reserved.
//

import Foundation
import UIKit

class CategoryItemCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var itemImageView: UIImageView!
    
    @IBOutlet weak var cellCategoryName: UILabel!
    
    
    
    func setCategoryItem(item:CategoryItem) {
        itemImageView.image = UIImage(named: item.itemImage)
        cellCategoryName.textColor = textColor
        cellCategoryName.text = item.itemImage
    }
    
}