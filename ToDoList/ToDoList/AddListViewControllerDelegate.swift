//
//  AddListViewControllerDelegate.swift
//  ToDoList
//
//  Created by Le Lin on 3/21/17.
//  Copyright © 2017 Le Lin. All rights reserved.
//

import Foundation

protocol AddListViewControllerDelegate: class {
    func addItemButtonPressed(by controller: AddListViewController, with title: String, desc: String, date: Date)
}
