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
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var activeSwitch: UISwitch!
    
    //MARK:- Variable -
    var postList: Hits? {
        didSet {
            titleLabel.text     = postList?.title
            let createdAtDateFormatter = DateFormatter()
            createdAtDateFormatter.dateFormat = "yyyy-MM-dd'T'hh:mm:ss.SSS'Z'"
            createdAtDateFormatter.timeZone = .current
            let displayDateFormatter = DateFormatter()
            displayDateFormatter.dateFormat = "E, d MMM yyyy hh:mm:ss a"
            let formattedCreatedDate = displayDateFormatter.string(from: createdAtDateFormatter.date(from: (postList?.created_at)!)!)
            dateLabel.text      = formattedCreatedDate
            activeSwitch.isOn   = postList?.isActive ?? false
        }
    }
    var toggleSwitchState: ((Hits)->())?
    
    //MARK:- Controller Method -
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    //MARK:- Action Method -
    @IBAction func didTapOnSwitch(_ sender: UISwitch) {
        postList?.isActive = !(postList?.isActive ?? false)
        toggleSwitchState!(postList!)
    }
    
}
