//
//  ColorSelector.swift
//  RGBColor
//
//  Created by Tyler Forgue on 4/20/16.
//  Copyright © 2016 Tyler Forgue. All rights reserved.
//

import UIKit

class ColorSelector: UIView {
    var colorPalette:Array<UIColor> = []
    var totalColorLbl:UILabel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let tap = UITapGestureRecognizer(target: self, action: #selector(ColorSelector.allSavedColor))
        self.addGestureRecognizer(tap)
        
        totalColorLbl = UILabel(frame: CGRectMake(self.frame.size.width - 10,20,300,30))
        totalColorLbl!.text = "0"
        totalColorLbl!.textAlignment = NSTextAlignment.Right
        self.addSubview(totalColorLbl!)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(removeColorFromArray(_:)), name: "hold", object: nil)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        let tap = UITapGestureRecognizer(target: self, action: #selector(ColorSelector.allSavedColor))
        self.addGestureRecognizer(tap)
        
        totalColorLbl = UILabel(frame: CGRectMake(self.frame.size.width - 10,20,100,100))
        totalColorLbl!.text = "0"
        totalColorLbl!.textAlignment = NSTextAlignment.Right
        self.addSubview(totalColorLbl!)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(removeColorFromArray(_:)), name: "hold", object: nil)
    }
    
    // all saved color in first view controller
    func allSavedColor(){
        colorPalette.append(self.backgroundColor!)
        var currentAmount = totalColorLbl!.intValueOfText()
        currentAmount += 1
        totalColorLbl?.text = "\(currentAmount)"
    }
    
    //increase totalLbl by one
    func increaseTotalLlb(){
        var currentAmount = totalColorLbl!.intValueOfText()
        currentAmount += 1
        totalColorLbl?.text = "\(currentAmount)"
    }
    
    //remove color from array
    func removeColorFromArray(notification:NSNotification){
        if let int = notification.object as? Int{
            colorPalette.removeAtIndex(int)
            totalColorLbl!.text = "\(colorPalette.count)"
        }
    }
}

extension UILabel{
    func  intValueOfText()->Int{
        if self.text != nil{
            return (self.text! as NSString).integerValue
        }
        return 0
    }
}
