//
//  AddItemDelegate.swift
//  BucketList
//
//  Created by Le Lin on 3/15/17.
//  Copyright © 2017 Le Lin. All rights reserved.
//

import Foundation

protocol AddItemDelegate: class {
    func cancelButtonPressed(by controller: AddItemTableViewController)
    func savedButtonPressed(by controller: AddItemTableViewController, with text: String, at IndexPath: NSIndexPath?)
}
