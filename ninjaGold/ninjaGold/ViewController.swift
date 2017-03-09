//
//  ViewController.swift
//  ninjaGold
//
//  Created by Le Lin on 3/8/17.
//  Copyright © 2017 Le Lin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var farmLabel: UILabel!
    @IBOutlet weak var caveLabel: UILabel!
    @IBOutlet weak var houseLabel: UILabel!
    @IBOutlet weak var casinoLabel: UILabel!
    
    var score = 0
    @IBAction func buildingPressed(_ sender: UIButton) {
        if sender.tag == 1 {
            let random = Int(arc4random_uniform(UInt32(11))) + 10
            score += random
            farmLabel.text = "You earned \(random) gold!"
            farmLabel.isHidden = false
            caveLabel.isHidden = true
            houseLabel.isHidden = true
            casinoLabel.isHidden = true
            scoreLabel.text = String(score)
        }
        else if sender.tag == 2 {
            let random = Int(arc4random_uniform(UInt32(6))) + 5
            score += random
            caveLabel.text = "You earned \(random) gold!"
            caveLabel.isHidden = false
            farmLabel.isHidden = true
            houseLabel.isHidden = true
            casinoLabel.isHidden = true
            scoreLabel.text = String(score)
        }
        else if sender.tag == 3 {
            let random = Int(arc4random_uniform(UInt32(4))) + 2
            score += random
            houseLabel.text = "You earned \(random) gold!"
            caveLabel.isHidden = true
            farmLabel.isHidden = true
            houseLabel.isHidden = false
            casinoLabel.isHidden = true
            scoreLabel.text = String(score)
        }
        else if sender.tag == 4 {
            let random = Int(arc4random_uniform(UInt32(101))) - 50
            score += random
            if random > 0 {
                casinoLabel.text = "You earned \(random) gold!"
            } else if random == 0 {
                casinoLabel.text = "You didn't earn shit!"
            } else {
                casinoLabel.text = "You lost \(random * -1) gold. Unlucky!"
            }
            caveLabel.isHidden = true
            farmLabel.isHidden = true
            houseLabel.isHidden = true
            casinoLabel.isHidden = false
            scoreLabel.text = String(score)
        }
    }
    
    @IBAction func resetButton(_ sender: Any) {
        score = 0
        farmLabel.isHidden = true
        caveLabel.isHidden = true
        houseLabel.isHidden = true
        casinoLabel.isHidden = true
        scoreLabel.text = String(score)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

