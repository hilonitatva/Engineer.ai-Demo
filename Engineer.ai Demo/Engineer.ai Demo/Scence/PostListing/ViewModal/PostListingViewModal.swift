//
//  PostListingViewModal.swift
//  Engineer.ai Demo
//
//  Created by PCQ177 on 02/01/20.
//  Copyright © 2020 PCQ177. All rights reserved.
//

import UIKit

class PostListingViewModal: BaseViewModal {

    //MARK:- Variable -
    var viewController: PostListingViewController!
    
    init(viewController: PostListingViewController) {
        self.viewController = viewController
    }
    
    //MARK:- View Method -
    func preparePostView() {
        viewController.postListingTableView.register(UINib(nibName: String(describing: PostListingTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: PostListingTableViewCell.self))
    }
}
