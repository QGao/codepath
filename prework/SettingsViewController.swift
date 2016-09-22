//
//  SettingsViewController.swift
//  prework
//
//  Created by Qing Gao on 9/21/16.
//  Copyright © 2016 Qing Gao. All rights reserved.
//

import UIKit

protocol SettingsDelegate {
    func setExtra(extra: Double)
}

class SettingsViewController: UIViewController {
    var delegate: SettingsDelegate?
    @IBOutlet weak var extra: UITextField!
    var extraTips : Double = 0.0
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        setExtra()
    }
    
    func setExtra() {
        let extraTips = Double(extra.text!) ?? 0
        delegate?.setExtra(extra: extraTips)
    }
    
    @IBAction func sendDataBack(_ sender: AnyObject) {
        setExtra()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
