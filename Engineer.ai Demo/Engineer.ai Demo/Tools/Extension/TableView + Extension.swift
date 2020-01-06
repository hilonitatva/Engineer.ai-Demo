//
//  TableView + Extension.swift
//  Engineer.ai Demo
//
//  Created by PCQ177 on 06/01/20.
//  Copyright © 2020 PCQ177. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {
    
    func registerAndGet<T: UITableViewCell>(cell identifier: T.Type) -> T? {
        let cellID = String(describing: identifier)
        if let cell = self.dequeueReusableCell(withIdentifier: cellID) as? T {
            return cell
        }else {
            self.register(UINib(nibName: cellID, bundle: nil), forCellReuseIdentifier: cellID)
            return self.dequeueReusableCell(withIdentifier: cellID) as? T
        }
    }
    
}
