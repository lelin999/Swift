//
//  ViewController.swift
//  BucketList
//
//  Created by Le Lin on 3/15/17.
//  Copyright © 2017 Le Lin. All rights reserved.
//

import UIKit

class BucketListTableViewController: UITableViewController, AddItemDelegate {
    var items = ["singing in the amazon", "visit a polar bear", "penguins flying"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        return cell
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        items.remove(at: indexPath.row)
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        performSegue(withIdentifier: "EditItemSegue", sender: indexPath)
        let navigation = segue.destination as! UINavigationController
        let addItemTableController = navigation.topViewController as! AddItemTableViewController
        addItemTableController.delegate = self
        let indexPath = sender as! NSIndexPath
        let item = items[indexPath.row]
        addItemTableController.item = item
        addItemTableController.indexPath = indexPath
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let navigation = segue.destination as! UINavigationController
        let addItemTableController = navigation.topViewController as! AddItemTableViewController
        addItemTableController.delegate = self

              //if sender is a accessory type then transfer info
    }
    
    func cancelButtonPressed(by controller: AddItemTableViewController) {
        dismiss(animated: true, completion: nil)
    }
    func savedButtonPressed(by controller: AddItemTableViewController, with text: String, at indexPath: NSIndexPath?) {
        if let ip = indexPath {
            items[ip.row] = text
        }
        else {
            items.append(text)
        }
        
        tableView.reloadData()
        dismiss(animated: true, completion: nil)
    }
}

