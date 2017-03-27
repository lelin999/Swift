//
//  ViewController.swift
//  oldPeople
//
//  Created by Le Lin on 3/14/17.
//  Copyright © 2017 Le Lin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var people = ["George", "Betty", "Fran", "Joe", "Helda", "Winifred", "Zed", "Sara", "Jeffy", "Abraham", "Anna", "Melinda"]
    
    @IBOutlet weak var oldPeopleTable: UITableView!
    @IBOutlet weak var personLabel: UILabel!
    @IBOutlet weak var ageDetail: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        oldPeopleTable.delegate = self
        oldPeopleTable.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "personAndAge", for: indexPath)
        let age = Int(arc4random_uniform(91)) + 5
        cell.detailTextLabel?.text = "\(age) years old"
        cell.textLabel?.text = "\(people[indexPath.row])"
        return cell
    }
    

}

