//
//  AddViewController.swift
//  Calender App
//
//  Created by Dylan Fiedler on 10/21/15.
//  Copyright © 2015 dtfdev. All rights reserved.
//

import UIKit

class AddViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate{

    @IBOutlet weak var eventName: UITextField!
    @IBOutlet weak var location: UITextField!
    @IBOutlet weak var descrtiptionTextView: UITextView!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    var date = NSDate()
    var source = "add"
    
    var name = "Cheetos"
    
    var time = ""
    
    var components = NSDateComponents()
    var dateFormatter = NSDateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.eventName.delegate = self
        self.location.delegate = self
        self.descrtiptionTextView.delegate = self
       
        dateFormatter.timeStyle = NSDateFormatterStyle.ShortStyle
        
        self.datePicker.minuteInterval = 15
        self.datePicker.setDate(date, animated: false)
        
        time = dateFormatter.stringFromDate(datePicker.date)

        print (time)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func valueChanged(sender: AnyObject) {
        
        
        
    }

    @IBAction func addEvent(sender: AnyObject) {
        self.dismissViewControllerAnimated(false, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
