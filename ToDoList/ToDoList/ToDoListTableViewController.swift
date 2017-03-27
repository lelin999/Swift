//
//  ToDoListTableViewController.swift
//  ToDoList
//
//  Created by Le Lin on 3/21/17.
//  Copyright © 2017 Le Lin. All rights reserved.
//

import UIKit
import CoreData

class ToDoListTableViewController: UITableViewController, AddListViewControllerDelegate {
    var items = [ToDoListItems]()
    let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchAllItems()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> CustomCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomCell
        cell.titleTextLabel.text = "hello"
        cell.dateTextLabel.text = "world"
        cell.descriptionTextLabel.text = "foobar"
        return cell
    }
    
    //checkmarks the given cell when clicked on
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.accessoryType = .checkmark
        }
    }
    
    func fetchAllItems() {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "ToDoListItems")
        do {
            let result = try managedObjectContext.fetch(request)
            items = result as! [ToDoListItems]
        } catch {
            print ("\(error)")
        }
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let nav = segue.destination as! UIViewController
//        let addListViewController = nav.top
//    }
    
    func addItemButtonPressed(by controller: AddListViewController, with title: String, desc: String, date: Date) {
        let item = NSEntityDescription.insertNewObject(forEntityName: "ToDoListItems", into: managedObjectContext)
        items.append(item as! ToDoListItems)
        tableView.reloadData()
        dismiss(animated: true, completion: nil)
    }
 }
