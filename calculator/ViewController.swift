//
//  ViewController.swift
//  calculator
//
//  Created by Brandon Stone on 12/14/16.
//  Copyright © 2016 Brandon Stone. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var timeDate: UILabel!
    @IBOutlet weak var viewFade: UIView!
    
    
    let userDefaults = UserDefaults()
    var dateFormatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.billField.becomeFirstResponder()
        dateFormatter.dateFormat = "MM/dd"
        self.timeDate.text = "Today's Date: " + dateFormatter.string(from: Date())
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //Sets all Labels and the segment control
        tipControl.selectedSegmentIndex = userDefaults.integer(forKey: "defaultTip")
        billField.text = userDefaults.string(forKey: "savedLastAmount")
        tipLabel.text = userDefaults.string(forKey: "savedLastTip")
        totalLabel.text = userDefaults.string(forKey: "savedLastTotal")
        
        //Makes sure that if the bill field has text the animation still comes up
        if(billField.text != ""){
            UIView.animate(withDuration: 0.1, delay: 0, options: [UIViewAnimationOptions.curveEaseIn],animations: {
                self.viewFade.frame.origin.y = 225.0
            }, completion: nil)
        }
    }

    @IBAction func calculateTip(_ sender: Any) {
        let billAmount = billField.text
        
        //Basic Calculations
        let tipPercentages = [0.15, 0.18, 0.2]
        
        let bill = Double(billAmount!) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
        //Saves last texts
        userDefaults.set(billAmount, forKey: "savedLastAmount")
        userDefaults.set(tipLabel.text, forKey: "savedLastTip")
        userDefaults.set(totalLabel.text, forKey: "savedLastTotal")
        userDefaults.synchronize()
        
        //Slide Up/Down Animation
        if(billAmount != ""){
            UIView.animate(withDuration: 0.3, delay: 0.2, options: [UIViewAnimationOptions.curveEaseIn],animations: {
                self.viewFade.frame.origin.y = 225.0
            }, completion: nil)}
        if(billAmount == ""){
            UIView.animate(withDuration: 0.1, delay: 0, options: [UIViewAnimationOptions.curveEaseIn],animations: {
                self.viewFade.frame.origin.y = 500.0
            }, completion: nil)
        }
    }
}

