//
//  anotherViewController.swift
//  RGBColor
//
//  Created by Tyler Forgue on 4/21/16.
//  Copyright © 2016 Tyler Forgue. All rights reserved.
//

import UIKit

class AnotherViewController: UIViewController {

    var incomingArray:Array<UIColor>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //useing the incomingArray
        for i in 0..<incomingArray!.count{
            let newColorView:SingleColorView = SingleColorView(frame: CGRect(x: CGFloat(i) * 90 + 10, y: 40, width: 80, height: view.frame.size.height - ( 20 + 40)), color: incomingArray![i])
            newColorView.tag = i
            view.addSubview(newColorView)
            
        }
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(removeColorFromArray(_:)), name: "hold", object: nil)
    }
    
    func removeColorFromArray(notification:NSNotification){
        if let int = notification.object as? Int{
            incomingArray!.removeAtIndex(int)
        }
        
        for i in view.subviews{
            /*if !(i is UIButton){
                //i is NOT a button
                i.removeFromSuperview()
            }
            else{
                //i is a button
                print(i.layer.frame)
            }*/
            if i is SingleColorView{
                i.removeFromSuperview()
            }
        }
        for i in 0..<incomingArray!.count{
            let newColorView:SingleColorView = SingleColorView(frame: CGRect(x: CGFloat(i) * 90 + 10, y: 40, width: 80, height: view.frame.size.height - ( 20 + 40)), color: incomingArray![i])
            newColorView.tag = i
            view.addSubview(newColorView)
            
        }
        
        //loop through view's subviews
        //if that view is not a button, remove it
        //redraw all views from the array
    }

    
    //back button to first veiw controller
    @IBAction func backBtn(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
            
}