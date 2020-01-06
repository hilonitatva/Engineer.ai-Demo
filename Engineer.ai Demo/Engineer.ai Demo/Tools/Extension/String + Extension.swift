//
//  String + Extension.swift
//  Engineer.ai Demo
//
//  Created by PCQ177 on 03/01/20.
//  Copyright © 2020 PCQ177. All rights reserved.
//

import Foundation
import UIKit

extension String {
    
    var localized: String {
        let locString = NSLocalizedString(self, comment: "")
        return locString
    }
    
}
