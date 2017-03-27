//
//  saveButtonDelegate.swift
//  ContactList
//
//  Created by Le Lin on 3/24/17.
//  Copyright © 2017 Le Lin. All rights reserved.
//

import Foundation
import UIKit

protocol SaveButtonDelegate: class {
    func saveButtonPressed(by controller: UIViewController, firstName: String?, lastName: String?, phoneNumber: String?, indexPath: Int?)
}
