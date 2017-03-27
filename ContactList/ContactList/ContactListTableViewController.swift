//
//  ContactListTableViewController.swift
//  ContactList
//
//  Created by Le Lin on 3/24/17.
//  Copyright © 2017 Le Lin. All rights reserved.
//

import UIKit
import CoreData

class ContactListTableViewController: UITableViewController, SaveButtonDelegate, CancelButtonDelegate {
    var contacts = [ContactItem]()
    let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchAllItems()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactListCell", for: indexPath) as! ContactListCell
        cell.nameTextLabel?.text = contacts[indexPath.row].firstName! + " " + contacts[indexPath.row].lastName!
        cell.phoneTextLabel?.text = contacts[indexPath.row].phoneNumber!
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alertController = UIAlertController(title: "Hey there", message: "What would you like to do?", preferredStyle: .actionSheet)
        let viewButton = UIAlertAction(title: "View", style: .default, handler: {(action)->Void in
            self.performSegue(withIdentifier: "viewSegue", sender: indexPath)
        })
        let editButton = UIAlertAction(title: "Edit", style: .default, handler: {(action)->Void in
            self.performSegue(withIdentifier: "contactSegue", sender: indexPath)
        })
        let deleteButton = UIAlertAction(title: "Delete", style: .destructive, handler: {(action)->Void in
            let contact = self.contacts[indexPath.row]
            self.managedObjectContext.delete(contact)
            self.contacts.remove(at: indexPath.row)
            self.tableView.reloadData()
            self.saveData()
        })
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: {(action)->Void in
            print ("cancelled")
        })
        
        alertController.addAction(viewButton)
        alertController.addAction(editButton)
        alertController.addAction(deleteButton)
        alertController.addAction(cancelButton)
        self.navigationController!.present(alertController, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "contactSegue" {
            let nav = segue.destination as! UINavigationController
            let addContactViewController = nav.topViewController as! AddContactViewController
            if let indexPath = sender as? IndexPath {
                let contact = contacts[indexPath.row]
                addContactViewController.title = "Edit Contact"
                addContactViewController.firstName = contact.firstName
                addContactViewController.lastName = contact.lastName
                addContactViewController.phoneNumber = contact.phoneNumber
                addContactViewController.indexPath = indexPath.row
            } else {
                addContactViewController.title = "New Contact"
            }
            addContactViewController.cancelDelegate = self
            addContactViewController.saveDelegate = self
            
        }
        else if segue.identifier == "viewSegue" {
            let nav = segue.destination as! UINavigationController
            let viewContactViewController = nav.topViewController as! ViewContactViewController
            if let indexPath = sender as? IndexPath {
                let contact = contacts[indexPath.row]
                viewContactViewController.title = contact.firstName
                viewContactViewController.name = contact.firstName! + " " + contact.lastName!
                viewContactViewController.phone = contact.phoneNumber
            }
            viewContactViewController.doneDelegate = self
        }
    }
    
    @IBAction func addContactUIButtonPressed(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "contactSegue", sender: sender)
    }
    
    func fetchAllItems() {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "ContactItem")
        do {
            let result = try managedObjectContext.fetch(request)
            contacts = result as! [ContactItem]
        } catch {
            print (error)
        }
    }
    
    func cancelButtonPressed(by controller: UIViewController) {
        dismiss(animated: true, completion: nil)
    }
    
    func saveButtonPressed(by controller: UIViewController, firstName: String?, lastName: String?, phoneNumber: String?, indexPath: Int?) {
        if firstName != "" && lastName != "" && phoneNumber != "" {
            if let ip = indexPath {
                let contact = contacts[ip]
                contact.firstName = firstName!
                contact.lastName = lastName!
                contact.phoneNumber = phoneNumber!
            }
            else {
                let contact = NSEntityDescription.insertNewObject(forEntityName: "ContactItem", into: managedObjectContext) as! ContactItem
                contact.firstName = firstName!
                contact.lastName = lastName!
                contact.phoneNumber = phoneNumber!
                contacts.append(contact)
            }
            saveData()
        }
        tableView.reloadData()
        dismiss(animated: true, completion: nil)

    }
    
    func saveData() {
        do {
            try managedObjectContext.save()
        } catch {
            print (error)
        }
    }
}
