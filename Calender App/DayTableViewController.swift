
//
//  DayTableViewController.swift
//  Calender App
//
//  Created by Dylan Fiedler on 10/12/15.
//  Copyright © 2015 dtfdev. All rights reserved.
//

import UIKit

class DayTableViewController: UITableViewController {

    @IBOutlet weak var timeTable: UITableView!
    
    var timeSlots: [NSDate!] = []
    
    @IBOutlet weak var add: UIBarButtonItem!
    var day: Int = 0
    var month: Int = 0
    var cellSize = CGSize(width: 0, height: 0)
    var selectedTime = 0
    
    let userCalender = NSCalendar.currentCalendar()
    let dateComponents = NSDateComponents()
    var eventTime = ""
    var eventName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.timeTable.dataSource = self
        self.timeTable.delegate = self
        
//        self.timeTable.estimatedRowHeight = 50
//        self.timeTable.rowHeight = UITableViewAutomaticDimension
        
        self.navigationController?.navigationBarHidden = false
        
        
        let height = CGFloat(UIScreen.mainScreen().bounds.height / 13)
        let width = CGFloat(UIScreen.mainScreen().bounds.width )
        
        cellSize = CGSize(width: width, height: height)
        self.timeTable.estimatedRowHeight = cellSize.height
        
        let start = NSDate()
        dateComponents.year = 2015
        dateComponents.month = month
        dateComponents.day = day
        dateComponents.timeZone = NSTimeZone(name: "CST")
        
        var newSlot = userCalender.dateBySettingHour(0, minute: 0, second: 0, ofDate: start, options: NSCalendarOptions())
        
        let endTime = userCalender.dateBySettingHour(23, minute: 59, second: 59, ofDate: start, options: NSCalendarOptions())
        
        while (newSlot?.earlierDate(endTime!) == newSlot){
            timeSlots.append(newSlot)
            newSlot = newSlot?.dateByAddingTimeInterval(60*60)
            print(newSlot)
        }
        
    }

    override func viewDidAppear(animated: Bool) {
         self.navigationController?.navigationBarHidden = false
        let indexPath = NSIndexPath(forRow: 7, inSection: 0)
        self.tableView.scrollToRowAtIndexPath(indexPath, atScrollPosition: UITableViewScrollPosition.Top, animated: true)
        
    }


    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return timeSlots.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as! DayCell
        
        let time = timeSlots[indexPath.row]
        
        cell.date = time
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "h:mm a"
        let timeString = dateFormatter.stringFromDate(time)
        
        cell.timeSlot.text = timeString
        
        if (cell.timeSlot.text == eventTime){
            cell.event1.hidden = false
            cell.event1.text = eventName
            //eventName = ""
            //eventTime = ""
        }
    
        
        if (indexPath.row < 7 || indexPath.row > 18 ){
                cell.backgroundColor = UIColor.lightGrayColor()
                cell.alpha = 0.75
                tableView.rowHeight = 30
            return cell
        } else {
            cell.backgroundColor = UIColor.whiteColor()
        }
        
        tableView.rowHeight = cellSize.height - 1
        self
        return cell
    }
    
    @IBAction func addButton(sender: AnyObject) {
        print(selectedTime)
        self.timeTable.deselectRowAtIndexPath(NSIndexPath(forRow: selectedTime, inSection: 0), animated: false)
        self.performSegueWithIdentifier("add", sender: self)
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        selectedTime = indexPath.row
        print(selectedTime)
    }
    
    override func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 20
    }
    
    @IBAction func unwindToVC(segue:UIStoryboardSegue) {
        if(segue.sourceViewController.isKindOfClass(AddViewController))
        {
            let alert = UIAlertView()
            let view = segue.sourceViewController as! AddViewController
            alert.title = "Added Event"
            alert.addButtonWithTitle("Ok")
            alert.show()
            
            eventTime = view.time
            eventName = view.eventName.text!
            
            self.timeTable.reloadData()
        }
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        let destination = segue.destinationViewController as! AddViewController
        destination.date = timeSlots[selectedTime]
        destination.source = "add"
    }
    

}
