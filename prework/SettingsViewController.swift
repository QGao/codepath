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
    let extraKey: String = "KEY_4_EXTRA"
    var delegate: SettingsDelegate?
    @IBOutlet weak var extra: UITextField!
    var extraTips : Double = 0.0
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadLast()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        setExtra()
        saveLast()
    }
    
    func setExtra() {
        delegate?.setExtra(extra: extraTips)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func loadLast(){
        let defaults = UserDefaults.standard
        extraTips = defaults.double(forKey: extraKey)
        extra.text = String(format: "%.2f",extraTips)
    }
    
    func saveLast(){
        let defaults = UserDefaults.standard
        defaults.set(extra.text, forKey: extraKey)
        defaults.synchronize()
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
