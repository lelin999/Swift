//
//  ViewController.swift
//  coldCall
//
//  Created by Le Lin on 3/8/17.
//  Copyright © 2017 Le Lin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var nameArr = ["Jay", "Bryant", "Jimmy", "Cody", "Ryota", "Uyanga", "Courtney"]
  
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    
    @IBAction func coldCall(_ sender: Any) {
        let random1 = Int(arc4random_uniform(UInt32(nameArr.count)))
        let random2 = Int(arc4random_uniform(5)) + 1
        nameLabel.text = nameArr[random1]
        numberLabel.text = String(random2)
        numberLabel.isHidden = false
        colorOfNum()
    }
    
    func colorOfNum() {
        if numberLabel.text == "1" || numberLabel.text == "2" {
            numberLabel.textColor = UIColor.red
        } else if numberLabel.text == "3" || numberLabel.text == "4" {
            numberLabel.textColor = UIColor.orange
        } else if numberLabel.text == "5" {
            numberLabel.textColor = UIColor.green
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        nameLabel.text = "Ready?"
        numberLabel.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}

