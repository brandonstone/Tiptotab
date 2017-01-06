//
//  SettingsViewController.swift
//  calculator
//
//  Created by Brandon Stone on 12/16/16.
//  Copyright © 2016 Brandon Stone. All rights reserved.
//

import UIKit
import Foundation

class SettingsViewController: UIViewController {

    @IBOutlet weak var defaultTipPercentange: UISegmentedControl!
    
    let userDefaults = UserDefaults()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        defaultTipPercentange.selectedSegmentIndex = userDefaults.integer(forKey: "defaultTip")
    }
    
    @IBAction func changeDefault(_ sender: Any) {
        userDefaults.set(defaultTipPercentange.selectedSegmentIndex, forKey: "defaultTip")
        userDefaults.synchronize()
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
