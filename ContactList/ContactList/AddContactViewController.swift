//
//  AddContactViewController.swift
//  ContactList
//
//  Created by Le Lin on 3/24/17.
//  Copyright © 2017 Le Lin. All rights reserved.
//

import UIKit

class AddContactViewController: UIViewController {
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    
    var firstName: String?
    var lastName: String?
    var phoneNumber: String?
    var indexPath: Int?
    
    weak var cancelDelegate: CancelButtonDelegate?
    weak var saveDelegate: SaveButtonDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        firstNameTextField.text = firstName
        lastNameTextField.text = lastName
        phoneNumberTextField.text = phoneNumber
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        cancelDelegate?.cancelButtonPressed(by: self)
    }

    @IBAction func saveButtonPressed(_ sender: UIBarButtonItem) {
        saveDelegate?.saveButtonPressed(by: self, firstName: firstNameTextField.text, lastName: lastNameTextField.text, phoneNumber: phoneNumberTextField.text, indexPath: indexPath)
    }
}
