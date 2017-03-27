//
//  ViewContactViewController.swift
//  ContactList
//
//  Created by Le Lin on 3/24/17.
//  Copyright © 2017 Le Lin. All rights reserved.
//

import UIKit

class ViewContactViewController: UIViewController {

    @IBOutlet weak var nameTextLabel: UILabel!
    @IBOutlet weak var phoneTextLabel: UILabel!
    weak var doneDelegate: CancelButtonDelegate?
    var name: String?
    var phone: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextLabel.text = name
        phoneTextLabel.text = phone
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        doneDelegate?.cancelButtonPressed(by: self)
    }
    
}
