//
//  AccordionsViewController.swift
//  phraseBookApplication
//
//  Created by Bolat Ashim on 8/4/16.
//  Copyright © 2016 Bolat Ashim. All rights reserved.
//

import UIKit
import AccordionMenu

class AccordionsViewController: AccordionTableViewController {
    
    var selectedCategory: String?
    
   
    
    var entries: [AccordionEntriesStruct] = []
    var cellData: [Parent] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //This figures out how to treat JSON file with swift and provides
        //a variable wordsData for us to make use of
        guard let jsonURL = NSBundle.mainBundle().URLForResource("words", withExtension: "json") else {
            print("Could not find words.json!")
            return
        }
        let jsonData = NSData(contentsOfURL: jsonURL)!
        let wordsData = JSON(data: jsonData)
        
        //I loop through a specific category of "greeting" and construct entry objects and append them to my entries array that I will use below
        if let selected = selectedCategory{
            for a in wordsData[selected]["data"].arrayValue{
                entries.append(AccordionEntriesStruct(phrase: a["phrase"].stringValue, translation: a["translation"].stringValue, transcription: a["transcription"].stringValue))
            }
        }else{
            print("optional")
        }
        

        
        for entry in entries{
            let theParent = Parent(state: .Collapsed, childs: [entry.translation, entry.transcription], title: " ▼  " + entry.phrase)
            
            cellData.append(theParent)
        }
        
        
        self.dataSource = cellData
        self.total = dataSource.count
        self.numberOfCellsExpanded = .One
        
        
        
        
        
        //        let item1 = Parent(state: .Collapsed, childs: ["SubItem 1", "SubItem 2", "SubItem 3"], title: "Item 1")
        //        let item2 = Parent(state: .Collapsed, childs: ["SubItem 1", "SubItem 2"], title: "Item 2")
        //        let item3 = Parent(state: .Collapsed, childs: ["SubItem 1", "SubItem 2", "SubItem 3"], title: "Item 3")
        //        let item4 = Parent(state: .Collapsed, childs: ["SubItem 1", "SubItem 2"], title: "Item 4")
        //        let item5 = Parent(state: .Collapsed, childs: ["SubItem 1", "SubItem 2"], title: "Item 5")
        //
        //        self.dataSource = [item1, item2, item3, item4, item5]
        //        self.total = dataSource.count
        //        self.numberOfCellsExpanded = .Several
    }
    
//    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        super.tableView(tableView, didSelectRowAtIndexPath: indexPath)
//        
//    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        super.tableView(tableView, didSelectRowAtIndexPath: indexPath)
        //self.arrowChange.text = "Changed"
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
    }
    
//    override func updateCells(parent: Int, index: Int) {
//        <#code#>
//    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}



