//
//  PostListingTableViewCell.swift
//  Engineer.ai Demo
//
//  Created by PCQ177 on 02/01/20.
//  Copyright © 2020 PCQ177. All rights reserved.
//

import UIKit

class PostListingTableViewCell: UITableViewCell {

    //MARK:- Outlets -
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var activeSwitch: UISwitch!
    
    //MARK:- Variable -
    var postList: Hits? {
        didSet {
            titleLabel.text     = postList?.title
            let createdAtDateFormatter = DateFormatter()
            createdAtDateFormatter.dateFormat = "yyyy-MM-dd'T'hh:mm:ss.SSS'Z'"
            createdAtDateFormatter.timeZone = .current
            if let date = createdAtDateFormatter.date(from: (postList?.created_at)!) {
                createdAtDateFormatter.dateFormat = "E, d MMM yyyy hh:mm:ss a"
                let formattedCreatedDate = createdAtDateFormatter.string(from: date)
                dateLabel.text      =  formattedCreatedDate
            }
            activeSwitch.isOn   =  postList?.isActive ?? false
        }
    }
    var toggleSwitchState: ((Hits)->())?
    
    //MARK:- Action Method -
    @IBAction func didTapOnSwitch(_ sender: UISwitch) {
        postList?.isActive = !(postList?.isActive ?? false)
        toggleSwitchState!(postList!)
    }
    
}
