//
//  NavigationControllerClass.swift
//  phraseBookApplication
//
//  Created by Bolat Ashim on 8/3/16.
//  Copyright © 2016 Bolat Ashim. All rights reserved.
//

import UIKit


class NavigationControllerClass: UINavigationController{

    override func viewDidLoad() {
        super.viewDidLoad()
        let size = self.navigationBar.frame.width / CGFloat(18.0)
        self.navigationBar.translucent = false
        self.navigationBar.barTintColor = navbarColor
        let titleDict: NSDictionary = [NSForegroundColorAttributeName: alternativeColor, NSFontAttributeName: UIFont(name: "Gill Sans", size: size)!]
        self.navigationBar.titleTextAttributes = titleDict as? [String : AnyObject]
        self.navigationBar.tintColor = alternativeColor
    }
    
}