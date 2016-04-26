//
//  SingleColorView.swift
//  RGBColor
//
//  Created by Tyler Forgue on 4/20/16.
//  Copyright © 2016 Tyler Forgue. All rights reserved.
//

import UIKit

class SingleColorView: UIView {
    
    var redLbl:UILabel?
    var blueLbl:UILabel?
    var greenLbl:UILabel?
    //setting lbl height
    let lblHeight:CGFloat  = 30
    var threshold:CGFloat = 128
    
    
    override init(frame: CGRect){
        super.init(frame: frame)
        CGColorGetComponents(self.backgroundColor?.CGColor)
        print(CGColorGetComponents(self.backgroundColor?.CGColor))
        //setting all Lbl frames
        redLbl = UILabel(frame: CGRectMake(0,self.frame.size.height * 0.25 ,self.frame.size.width,lblHeight))
        greenLbl = UILabel(frame: CGRectMake(0,self.frame.size.height * 0.50 ,self.frame.size.width,lblHeight))
        blueLbl = UILabel(frame: CGRectMake(0,self.frame.size.height * 0.75 ,self.frame.size.width,lblHeight))
        //setting all label text aligment and calling lbl
        redLbl!.text = "0"
        redLbl!.textAlignment = NSTextAlignment.Center
        self.addSubview(redLbl!)
        greenLbl!.text = "0"
        greenLbl!.textAlignment = NSTextAlignment.Center
        self.addSubview(greenLbl!)
        blueLbl!.text = "0"
        blueLbl!.textAlignment = NSTextAlignment.Center
        self.addSubview(blueLbl!)
    }
    
    init(frame: CGRect, color: UIColor){
        super.init(frame: frame)
        //setting the background color of the incomingData:Array<UIColor>
        backgroundColor = color
        CGColorGetComponents(self.backgroundColor?.CGColor)
        print(CGColorGetComponents(self.backgroundColor?.CGColor))
        //setting all Lbl frames
        redLbl = UILabel(frame: CGRectMake(0,self.frame.size.height * 0.25,self.frame.size.width,lblHeight))
        greenLbl = UILabel(frame: CGRectMake(0,self.frame.size.height * 0.50 - 15,self.frame.size.width,lblHeight))
        blueLbl = UILabel(frame: CGRectMake(0,self.frame.size.height * 0.75,self.frame.size.width,lblHeight))
        //setting all label text aligment and calling lbl
        redLbl!.text = "0"
        redLbl!.textAlignment = NSTextAlignment.Center
        self.addSubview(redLbl!)
        greenLbl!.text = "0"
        greenLbl!.textAlignment = NSTextAlignment.Center
        self.addSubview(greenLbl!)
        blueLbl!.text = "0"
        blueLbl!.textAlignment = NSTextAlignment.Center
        self.addSubview(blueLbl!)
        
        //pull red value from the UIColor by converting it to a Core Image Color
        let red : CGFloat = CoreImage.CIColor(color: color).red * 255
        let blue : CGFloat = CoreImage.CIColor(color: color).blue * 255
        let green : CGFloat = CoreImage.CIColor(color: color).green * 255
        //setting the lbl.text to the correct value of the lbl
        redLbl!.text = "\(Int(red))"
        blueLbl!.text = "\(Int(blue))"
        greenLbl!.text = "\(Int(green))"
        let longPressRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(SingleColorView.longPressed))
        self.addGestureRecognizer(longPressRecognizer)
        //changes text color to white
        if (red > threshold)&&(blue > threshold) && ( green > threshold){
            redLbl!.textColor = UIColor.whiteColor()
            blueLbl!.textColor = UIColor.whiteColor()
            greenLbl!.textColor = UIColor.whiteColor()
        }
        //changes text color to black
        if (red < threshold)&&(blue < threshold) && ( green < threshold){
            redLbl!.textColor = UIColor.blackColor()
            blueLbl!.textColor = UIColor.blackColor()
            greenLbl!.textColor = UIColor.blackColor()
        }
    }
    //long touch function
    func longPressed(sender: UILongPressGestureRecognizer){
        if sender.state == .Ended{
            NSNotificationCenter.defaultCenter().postNotificationName("hold", object: self.tag)
           self.removeFromSuperview()
            
        }
    }
    
    required init(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)!
        CGColorGetComponents(self.backgroundColor?.CGColor)
        print(CGColorGetComponents(self.backgroundColor?.CGColor))
    }
    
   }
