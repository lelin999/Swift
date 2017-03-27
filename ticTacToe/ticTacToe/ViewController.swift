//
//  ViewController.swift
//  ticTacToe
//
//  Created by Le Lin on 3/8/17.
//  Copyright © 2017 Le Lin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var box1: UIButton!
    @IBOutlet weak var box2: UIButton!
    @IBOutlet weak var box3: UIButton!
    @IBOutlet weak var box4: UIButton!
    @IBOutlet weak var box5: UIButton!
    @IBOutlet weak var box6: UIButton!
    @IBOutlet weak var box7: UIButton!
    @IBOutlet weak var box8: UIButton!
    @IBOutlet weak var box9: UIButton!
    @IBOutlet weak var winnerLabel: UILabel!
    
    var player = ["p1": true, "p2": false]
    var winning = [[1,2,3],[1,4,7],[1,5,9],[2,5,8],[4,5,6],[7,8,9], [3,5,7],[3,6,9]]
    
    @IBAction func onClick(_ sender: UIButton) {
        var playerColor = UIColor.red
        if player["p1"] == true {
            player["p1"] = false
            player["p2"] = true
            playerColor = UIColor.red
        } else {
            player["p1"] = true
            player["p2"] = false
            playerColor = UIColor.blue
        }
        let buttonId = sender.tag
        switch buttonId {
            case 1:
                box1.backgroundColor = playerColor
                sender.isEnabled = false
            case 2:
                box2.backgroundColor = playerColor
                sender.isEnabled = false
            case 3:
                box3.backgroundColor = playerColor
                sender.isEnabled = false
            case 4:
                box4.backgroundColor = playerColor
                sender.isEnabled = false
            case 5:
                box5.backgroundColor = playerColor
                sender.isEnabled = false
            case 6:
                box6.backgroundColor = playerColor
                sender.isEnabled = false
            case 7:
                box7.backgroundColor = playerColor
                sender.isEnabled = false
            case 8:
                box8.backgroundColor = playerColor
                sender.isEnabled = false
            case 9:
                box9.backgroundColor = UIColor.red
                sender.isEnabled = false
            default:
                box1.backgroundColor = UIColor.gray
                sender.isEnabled = true
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        UIReset()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func UIReset () {
        box1.backgroundColor = UIColor.gray
        box2.backgroundColor = UIColor.gray
        box3.backgroundColor = UIColor.gray
        box4.backgroundColor = UIColor.gray
        box5.backgroundColor = UIColor.gray
        box6.backgroundColor = UIColor.gray
        box7.backgroundColor = UIColor.gray
        box8.backgroundColor = UIColor.gray
        box9.backgroundColor = UIColor.gray
        winnerLabel.isHidden = true
        player["p1"] = true
        player["p2"] = false
        box1.isEnabled = true
    }
    
    @IBAction func reset(_ sender: Any) {
        UIReset()
    }
    
}

