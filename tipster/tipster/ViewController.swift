//
//  ViewController.swift
//  tipster
//
//  Created by Le Lin on 3/9/17.
//  Copyright © 2017 Le Lin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var totalDisplayLabel: UILabel!
    @IBOutlet weak var lowerPercentLabel: UILabel!
    @IBOutlet weak var medianPercentLabel: UILabel!
    @IBOutlet weak var higherPercentLabel: UILabel!
    @IBOutlet weak var lowerTipValueLabel: UILabel!
    @IBOutlet weak var medianTipValueLabel: UILabel!
    @IBOutlet weak var higherTipValueLabel: UILabel!
    @IBOutlet weak var lowerTotalLabel: UILabel!
    @IBOutlet weak var medianTotalLabel: UILabel!
    @IBOutlet weak var higherTotalLabel: UILabel!
    @IBOutlet weak var peopleLabel: UILabel!
    @IBOutlet weak var tipSlider: UISlider!
    @IBOutlet weak var peopleSlider: UISlider!
    
    var total = String()

    @IBAction func onClickButton(_ sender: UIButton) {
        let buttonId = sender.tag
        var decimalCheck = 0
        
        switch buttonId {
        case 0:
            if total.characters.count == 0 {
                total += ""
            } else {
                total += String(0)
            }
        case 1:
            total += String(1)
        case 2:
            total += String(2)
        case 3:
            total += String(3)
        case 4:
            total += String(4)
        case 5:
            total += String(5)
        case 6:
            total += String(6)
        case 7:
            total += String(7)
        case 8:
            total += String(8)
        case 9:
            total += String(9)
        case 10:
            if total.characters.count == 0 {
                total = String(0)
            }
            if total.range(of:".") != nil {
                total += ""
            }
            else {
                total += "."
            }
        default:
            total += ""
        }
        
        if total.characters.count == 0 {
            totalDisplayLabel.text = String(0)
        }
        else {
            totalDisplayLabel.text = total
        }
        
    }
    
    @IBAction func clearButton(_ sender: UIButton) {
        total = String()
        totalDisplayLabel.text = String(0)
    }
    var a = 0
    @IBAction func tipPercentSlider(_ sender: UISlider) {
        a = Int(sender.value)
        
        lowerPercentLabel.text = String(a)
        medianPercentLabel.text = String(Int(sender.value) + 5)
        higherPercentLabel.text = String(Int(sender.value) + 10)
        
        if Double(total) != nil {
            let doubleTotal = Double(total)
            lowerTipValueLabel.text = String(format: "%.2f", Double(round(sender.value) / 100) * doubleTotal!)
            medianTipValueLabel.text = String(format: "%.2f", Double((round(sender.value) + 5) / 100) * doubleTotal!)
            higherTipValueLabel.text = String(format: "%.2f", Double(round((sender.value) + 10) / 100) * doubleTotal!)
            lowerTotalLabel.text = String(format: "%.2f", Double(round(sender.value) / 100) * doubleTotal! + doubleTotal!)
            medianTotalLabel.text = String(format: "%.2f", Double(round((sender.value) + 5) / 100) * doubleTotal! + doubleTotal!)
            higherTotalLabel.text = String(format: "%.2f", Double((round(sender.value) + 10) / 100) * doubleTotal! + doubleTotal!)
        }
        
    }
   
    @IBAction func numberPeopleSlider(_ sender: UISlider) {
        peopleLabel.text = String(Int(sender.value))
        if lowerTipValueLabel.text != nil {
            lowerTipValueLabel.text = String(format: "%.2f", Double(a) * Double(Int(total)!) / 100 / Double(Int(sender.value)))
        }
//        lowerTipValueLabel.text = String(format: "%.2f", (Double(sender.value / 100) * Double(total)!) / Double(sender.value))
//        medianTipValueLabel.text = String(format: "%.2f", (Double((sender.value + 5) / 100) * Double(total)!) / Double(sender.value))
//        higherTipValueLabel.text = String(format: "%.2f", (Double((sender.value + 10) / 100) * Double(total)!) / Double(sender.value))
//        lowerTotalLabel.text = String(format: "%.2f", (Double(sender.value / 100) * Double(total)! + Double(total)!) / Double(sender.value))
//        medianTotalLabel.text = String(format: "%.2f", (Double((sender.value + 5) / 100) * Double(total)! + Double(total)!) / Double(sender.value))
//        higherTotalLabel.text = String(format: "%.2f", (Double((sender.value + 10) / 100) * Double(total)! + Double(total)!) / Double(sender.value))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        totalDisplayLabel.text = String(0)
        peopleSlider.minimumValue = 1
        print (peopleSlider.minimumValue)
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

