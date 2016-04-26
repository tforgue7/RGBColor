//
//  ViewController.swift
//  RGBColor
//
//  Created by Tyler Forgue on 4/19/16.
//  Copyright © 2016 Tyler Forgue. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var redLbl: UILabel!
    @IBOutlet weak var redSlider: UISlider!
    
    @IBOutlet weak var blueLbl: UILabel!
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBOutlet weak var greenLbl: UILabel!
    @IBOutlet weak var greenSlider: UISlider!
    
    @IBOutlet weak var ColorView: ColorSelector!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeAColor()
        redLbl.text = "\(redSlider.value)"
        greenLbl.text = "\(greenSlider.value)"
        blueLbl.text = "\(blueSlider.value)"
        
    }
    
    //red slider
    @IBAction func redColorProgress(sender: UISlider) {
        let redColor = Int(sender.value)
        redLbl.text = "\(redColor)"
        makeAColor()
    }
    
    //blue slider
    @IBAction func BlueColorProgress(sender: UISlider) {
        let blueColor = Int(sender.value)
        blueLbl.text = "\(blueColor)"
        makeAColor()
    }
    
    //green slider
    @IBAction func greenColorProgress(sender: UISlider) {
        let greenColor = Int(sender.value)
        greenLbl.text = "\(greenColor)"
        makeAColor()
    }
    
    //making a color with the three color values
    func makeAColor(){
        let redColor = redSlider.value
        let blueColor = blueSlider.value
        let greenColor = greenSlider.value
        
        ColorView.backgroundColor = UIColor(red: CGFloat(redColor)/255, green: CGFloat(greenColor)/255, blue: CGFloat(blueColor)/255, alpha: 1)
    }
    
    // segue to send a color array to anotherViewController
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let sender = segue.destinationViewController as! AnotherViewController
        sender.incomingArray = ColorView.colorPalette
    }
    
}

















