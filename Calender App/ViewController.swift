//
//  ViewController.swift
//  Calender App
//
//  Created by Dylan Fiedler on 10/9/15.
//  Copyright © 2015 dtfdev. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var day: [Int] = []
    var selectedDay: Int = 0
    var selectedMonth: Int = 0
    var date = NSDate()
    var today = 0
    var month = 0
    var current = false
    var scroll: NSIndexPath = NSIndexPath(forRow: 0, inSection: 0)
    var calendar = NSCalendar.currentCalendar()
    var todayIndexPath = NSIndexPath(forRow: 0, inSection: 0)


    
    var months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    
    var cellSize = CGSize(width: 0, height: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        for i in 1...31{
            day.append(i)
        }
        
        var dayComponent = calendar.component(NSCalendarUnit.Day, fromDate: date)
        var monthComponent = calendar.component(NSCalendarUnit.Month, fromDate: date)
        
        var width = CGFloat(UIScreen.mainScreen().bounds.width)
        var height = CGFloat(UIScreen.mainScreen().bounds.height / 8)
        cellSize = CGSizeMake( width/10 , height)
        
        scroll = NSIndexPath(forRow: 15, inSection: monthComponent - 1)
        month = monthComponent
        today = dayComponent
        
//        self.collectionView.cellForItemAtIndexPath(scroll)?.backgroundColor = UIColor.redColor()

        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func functodayTapped(sender: AnyObject) {
        self.collectionView.scrollToItemAtIndexPath(scroll, atScrollPosition: UICollectionViewScrollPosition.CenteredVertically, animated: false)
    }
    override func viewDidAppear(animated: Bool) {
        self.collectionView.scrollToItemAtIndexPath(scroll, atScrollPosition: UICollectionViewScrollPosition.CenteredVertically, animated: false)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 12
    }
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        switch (section){
        case 0,2,4,6,7,9,11:
                return 31
        case 1:
                return 28
        default:
                return 30
        }
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        var cell = self.collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as? CollectionViewCell
        
        if (cell?.hidden == true){
            cell!.dateLabel!.text = "\(day[indexPath.item])"
            cell!.hidden = false
        }
        
        
        
        if (cell?.dateLabel.text == "\(today)" && indexPath.section + 1 == month){
            cell?.backgroundColor = UIColor.redColor()
            todayIndexPath = indexPath
        } else {
            cell?.backgroundColor = UIColor.clearColor()
        }
        
        
        return cell!
    }

    func today(indexPath: NSIndexPath){
        self.collectionView.cellForItemAtIndexPath(indexPath)?.backgroundColor = UIColor.redColor()
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return cellSize
        
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let cell = collectionView.cellForItemAtIndexPath(indexPath) as! CollectionViewCell
        //highlight it with a red circle
        
        selectedDay = (Int) (cell.dateLabel.text!)!
        selectedMonth = indexPath.section + 1
        
        self.performSegueWithIdentifier("day", sender: self)
        
    }
    
    func collectionView(collectionView: UICollectionView,
        viewForSupplementaryElementOfKind kind: String,
        atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
            //1
            switch kind {
                //2
            case UICollectionElementKindSectionHeader:
                //3
                let headerView =
                collectionView.dequeueReusableSupplementaryViewOfKind(kind,
                    withReuseIdentifier: "header",
                    forIndexPath: indexPath)
                    as! HeaderCollectionReusableView
                headerView.monthLabel.text = months[indexPath.section]
                return headerView
            default:
                //4
                assert(false, "Unexpected element kind")
            }
    }
    
    
    
    @IBAction func add(sender: AnyObject) {
        self.performSegueWithIdentifier("add", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "day") {
            let destination = segue.destinationViewController as! DayTableViewController
            destination.day = selectedDay
            destination.month = selectedMonth
        } else {
            let destination = segue.destinationViewController as! AddViewController
            destination.source = "home"
        }
    }
}

