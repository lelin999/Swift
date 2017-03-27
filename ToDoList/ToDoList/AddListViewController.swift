//
//  AddListViewController.swift
//  ToDoList
//
//  Created by Le Lin on 3/21/17.
//  Copyright © 2017 Le Lin. All rights reserved.
//

import UIKit

class AddListViewController: UIViewController {

    @IBOutlet weak var addTitleTextField: UITextField!
    @IBOutlet weak var addDescriptionTextField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    weak var delegate: AddListViewControllerDelegate?
    var text1: String?
    var text2: String?
    var date: Date?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func datePickerChanged(_ sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateStyle = DateFormatter.Style.short
        dateFormatter.timeStyle = DateFormatter.Style.short
        
        let strDate = dateFormatter.string(from: datePicker.date)
        
    }
    

    @IBAction func addItemButtonPressed(_ sender: UIButton) {
        text1 = addTitleTextField.text
        text2 = addDescriptionTextField.text
        //date = datePicker
        delegate?.addItemButtonPressed(by: self, with: text1!, desc: text2!, date: Date)
    }

}
