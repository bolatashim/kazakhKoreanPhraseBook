//
//  CategoriesSectionsViewController.swift
//  finalPhraser
//
//  Created by Bolat Ashim on 8/3/16.
//  Copyright © 2016 Bolat Ashim. All rights reserved.
//

import Foundation
import UIKit
import AccordionMenu

class CategoriesMenuViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    var selectedCellIndexPath = 0
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBAction func LeftMenuButtonTapped(sender: AnyObject) {
        
        let appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        appDelegate.centerContainer!.toggleDrawerSide(MMDrawerSide.Left, animated: true, completion: nil)
        
    }
    

    
    
    
    
    var categoryItems: [CategoryItem] = []
    
    // MARK: -
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = backColor
        self.collectionView.backgroundColor = backColor
        //UINavigationBar.appearance().tintColor = navbarColor
        initCategoryItems()
        collectionView.reloadData()
//        
//        
//        collectionView.layer.shadowColor = UIColor.blackColor().CGColor
//        collectionView.layer.shadowOffset = CGSizeMake(0, 1)
//        collectionView.layer.shadowOpacity = 1
//        collectionView.layer.shadowRadius = 1.0
//        collectionView.clipsToBounds = false
//        collectionView.layer.masksToBounds = false
    }
    

    
    
    private func initCategoryItems() {
        
        var items = [CategoryItem]()
        let inputFile = NSBundle.mainBundle().pathForResource("categories", ofType: "plist")
        
        let inputDataArray = NSArray(contentsOfFile: inputFile!)
        
        for inputItem in inputDataArray as! [Dictionary<String, String>] {
            let categoryItem = CategoryItem(dataDictionary: inputItem)
            items.append(categoryItem)
        }
        
        categoryItems = items
    }
    
    // MARK: -
    // MARK: - UICollectionViewDataSource
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryItems.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("CategoryItemCollectionViewCell", forIndexPath: indexPath) as! CategoryItemCollectionViewCell
//        cell.layer.shadowColor = UIColor.blackColor().CGColor
//        cell.layer.shadowOffset = CGSizeMake(0, 1)
//        cell.layer.shadowOpacity = 1
//        cell.layer.shadowRadius = 1.0
//        cell.clipsToBounds = false
//        cell.layer.masksToBounds =  false
////        
//        cell.layer.masksToBounds = false;
//        cell.layer.shadowOpacity = 0.75;
//        cell.layer.shadowRadius = 10.0;
//        cell.layer.shouldRasterize = false;
        
        //cell.layer.shadowPath = UIBezierPath(roundedRect: CGRect(cell.frame.size.width/2 - (cell.frame.size.width - 50)), byRoundingCorners: cell.frame.size.height, cornerRadii: )
        //cell.layer.shadowPath = [UIBezierPath bezierPathWithRect:CGRectMake(self.frame.size.width/2 - (self.frame.size.width - 50)/2, self.frame.size.height, self.frame.size.width - 50, 10)].CGPath;

        //cell.layer.shadowPath = UIBezierPath(
        cell.backgroundColor = alternativeColor
        cell.layer.borderWidth = 1.0
        cell.layer.borderColor = UIColor.grayColor().CGColor
        cell.setCategoryItem(categoryItems[indexPath.row])
        return cell
        
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    //    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
    //
    //        let commentView = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "GalleryItemCommentView", forIndexPath: indexPath) as! GalleryItemCommentView
    //
    //        commentView.commentLabel.text = "Supplementary view of kind \(kind)"
    //
    //        return commentView
    //    }
    //
    // MARK: -
    // MARK: - UICollectionViewDelegate
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        selectedCellIndexPath = indexPath.row
//        let cell = collectionView.cellForItemAtIndexPath(indexPath)
//        
//        
//        cell!.layer.borderWidth = 2.0
//        cell!.layer.borderColor = UIColor.grayColor().CGColor
        
        //        let alert = UIAlertController(title: "didSelectItemAtIndexPath:", message: "Indexpath = \(indexPath)", preferredStyle: .Alert)
        //
        //        let alertAction = UIAlertAction(title: "Dismiss", style: .Destructive, handler: nil)
        //        alert.addAction(alertAction)
        //
        //        self.presentViewController(alert, animated: true, completion: nil)
        
        //        let nextViewController:JustViewController = JustViewController()
        //
        
        
        //self.presentViewController(nextViewController, animated: true, completion: nil)
        //

        self.performSegueWithIdentifier("segueToAccordions", sender: nil)
        
        
        //print("\(indexPath.row) and \(indexPath.section)")
        // print("\(indexPath) and \(indexPath[0])")
        //self.presentViewController(alert, animated: true, completion: nil)
    }
    
    // MARK: -
    // MARK: - UICollectionViewFlowLayout
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let picDimension = self.view.frame.size.width * 11.0 / 24.2
        
        
        
        return CGSizeMake(picDimension, picDimension)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        let leftRightInset = self.view.frame.size.width / 72.0
        print(section)

        return UIEdgeInsetsMake(leftRightInset, leftRightInset, leftRightInset, leftRightInset)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "segueToAccordions"{
            let tableController = segue.destinationViewController as! AccordionsViewController
//            let pathIndex = UICollectionView.indexPathForCell(self.collectionView)
           // let pathIndex = self.collectionView.indexPathForCell(CategoryItemCollectionViewCell())
           // pathIndex?.item
            
            tableController.selectedCategory = categoryItems[selectedCellIndexPath].itemImage
            
            
//            let indexPath = UICollectionView.indexPathForCell(self.collectionView)
//            tableController.selectedCategory = categoryItems[indexPath.]//CategoryItems[indexPath.row].itemImage
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
}