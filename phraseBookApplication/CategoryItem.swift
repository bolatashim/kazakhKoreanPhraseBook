//
//  CategoryItem.swift
//  finalPhraser
//
//  Created by Bolat Ashim on 8/3/16.
//  Copyright © 2016 Bolat Ashim. All rights reserved.
//

import Foundation

class CategoryItem {
    
    var itemImage: String
    
    init(dataDictionary:Dictionary<String,String>) {
        itemImage = dataDictionary["itemImage"]!
    }
    
    class func newCategoryItem(dataDictionary:Dictionary<String,String>) -> CategoryItem {
        return CategoryItem(dataDictionary: dataDictionary)
    }
    
}
