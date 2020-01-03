//
//  BaseViewController.swift
//  Engineer.ai Demo
//
//  Created by PCQ177 on 02/01/20.
//  Copyright © 2020 PCQ177. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    //MARK:- Controller Method -
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    //MARK:- Custom Method -
    func showAlert(message: String) {
        let alert = UIAlertController(title: "projectName".localized, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ok".localized, style: .default, handler: nil))
        self.present(alert,animated: true,completion: nil)
    }

}
