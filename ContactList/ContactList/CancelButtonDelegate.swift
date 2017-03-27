//
//  cancelButtonDelegate.swift
//  ContactList
//
//  Created by Le Lin on 3/24/17.
//  Copyright © 2017 Le Lin. All rights reserved.
//

import Foundation
import UIKit

protocol CancelButtonDelegate: class {
    func cancelButtonPressed(by controller: UIViewController)
}
