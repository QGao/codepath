//
//  ViewController.swift
//  prework
//
//  Created by Qing Gao on 9/21/16.
//  Copyright © 2016 Qing Gao. All rights reserved.
//

import UIKit

class ViewController: UIViewController, SettingsDelegate {

    @IBOutlet weak var tiplabel: UILabel!
    @IBOutlet weak var totallabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var percentages: UISegmentedControl!
    var extraTips : Double = 0.0
    let billFieldKey: String = "KEY_4_BILL"
    let extraKey: String = "KEY_4_EXTRA"
    
    @IBAction func calculate(_ sender: AnyObject) {
        calculateAll()
    }
    
    func calculateAll(){
        let tipPercentages = [0.18, 0.2, 0.25]
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentages[percentages.selectedSegmentIndex] + extraTips
        let total = tip + bill
        tiplabel.text = String(format:"$%.2f",tip)
        totallabel.text = String(format:"$%.2f",total)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadLast()
        calculateAll()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        saveLast()
    }
    
    func loadLast(){
        let defaults = UserDefaults.standard
        let bill = defaults.object(forKey: billFieldKey)
        billField.text = bill as! String?
        extraTips = defaults.double(forKey: extraKey)
    }
    
    func saveLast(){
        let defaults = UserDefaults.standard
        defaults.set(billField.text, forKey: billFieldKey)
        defaults.synchronize()
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "settingsSague" {
            if let destination = segue.destination as? SettingsViewController {
                destination.delegate = self
            }
        }
    }
    
    func setExtra(extra: Double) {
        extraTips = extra
        calculateAll()
    }

}

