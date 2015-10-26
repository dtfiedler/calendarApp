//
//  CollectionViewCell.swift
//  Calender App
//
//  Created by Dylan Fiedler on 10/9/15.
//  Copyright © 2015 dtfdev. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var dateLabel: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
       
    }
    
    override func drawRect(rect: CGRect) {
//        let path = UIBezierPath(ovalInRect: rect)
//        UIColor.redColor().setFill()
//        path.fill()
//        //set up the width and height variables
//        //for the horizontal stroke
//        let plusHeight: CGFloat = 3.0
//        let plusWidth: CGFloat = min(bounds.width, bounds.height) * 0.6
//        
//        //create the path
//        var plusPath = UIBezierPath()
//        
//        //set the path's line width to the height of the stroke
//        plusPath.lineWidth = plusHeight
//        
//        //move the initial point of the path
//        //to the start of the horizontal stroke
//        plusPath.moveToPoint(CGPoint(
//            x:bounds.width/2 - plusWidth/2 + 0.5,
//            y:bounds.height/2 + 0.5))
//        
//        //add a point to the path at the end of the stroke
//        plusPath.addLineToPoint(CGPoint(
//            x:bounds.width/2 + plusWidth/2 + 0.5,
//            y:bounds.height/2 + 0.5))
//        
//        plusPath.moveToPoint(CGPoint(
//            x: bounds.width/2 + 0.5,
//            y: bounds.height/2 - plusWidth/2 + 0.5
//            ))
//        
//        plusPath.addLineToPoint(CGPoint(
//            x: bounds.width/2 + 0.5,
//            y: bounds.height/2 + plusWidth/2 + 0.5
//            ))
//        
//        //set the stroke color
//        UIColor.whiteColor().setStroke()
//        
//        //draw the stroke
//        plusPath.stroke()
    }
}
