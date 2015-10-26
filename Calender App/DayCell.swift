//
//  DayCell.swift
//  Calender App
//
//  Created by Dylan Fiedler on 10/12/15.
//  Copyright © 2015 dtfdev. All rights reserved.
//

import UIKit

class DayCell: UITableViewCell {

    @IBOutlet weak var timeSlot: UILabel!
    @IBOutlet weak var event1: UILabel!
    @IBOutlet weak var event2: UILabel!
    
    var events = false
    
    var date: NSDate!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
