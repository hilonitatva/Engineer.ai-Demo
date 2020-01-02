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
    
    
    //MARK:- Controller Method -
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    //MARK:- Action Method -
    @IBAction func didTapOnSwitch(_ sender: UISwitch) {
    }
    
}
