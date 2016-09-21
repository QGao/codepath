//
//  ViewController.swift
//  prework
//
//  Created by Qing Gao on 9/21/16.
//  Copyright © 2016 Qing Gao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tiplabel: UILabel!
    @IBOutlet weak var totallabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var percentages: UISegmentedControl!
    
    @IBAction func calculate(_ sender: AnyObject) {
        let tipPercentages = [0.18, 0.2, 0.25]
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentages[percentages.selectedSegmentIndex]
        let total = tip + bill
        tiplabel.text = String(format:"$%.2f",tip)
        totallabel.text = String(format:"$%.2f",total)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(_ sender: AnyObject) {
        view.endEditing(true)
    }

}

