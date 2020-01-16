//
//  PostListingViewController.swift
//  Engineer.ai Demo
//
//  Created by PCQ177 on 02/01/20.
//  Copyright © 2020 PCQ177. All rights reserved.
//

import UIKit

class PostListingViewController: BaseViewController {

    //MARK:- Outlets -
    @IBOutlet weak var postListingTableView                  : UITableView!
    @IBOutlet weak var tableFooterView                       : UIView!
    
    //MARK:- Variable -
    lazy var viewModal              : PostListingViewModal          = PostListingViewModal(viewController: self)
    lazy var viewNavigator          : PostListingViewNavigator      = PostListingViewNavigator(viewController: self)
    var postDetail: Post?
    var hitsArray = [Hits]()
    
    
    //MARK:- Controller Method -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.prepareView()
        // Do any additional setup after loading the view.
    }
    
    //MARK:- View Method -
    private func prepareView() {
        viewModal.preparePostView()
        print("Prepare View")
    }
    
    //Pull To Refresh
    var refreshController: UIRefreshControl {
        let tempRefreshController = UIRefreshControl()
        tempRefreshController.attributedTitle = NSAttributedString(string: "Pull To Refresh")
        tempRefreshController.addTarget(self, action: #selector(refreshTable), for: .valueChanged)
        return tempRefreshController
    }
    
    //MARK:- Objective Method -
    @objc func refreshTable() {
        viewModal.prepareInitialTableView()
    }

}
//NARK:- Table View Delegate & DataSource -
extension PostListingViewController: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.hitsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let postCell = tableView.registerAndGet(cell: PostListingTableViewCell.self)
        postCell?.postList = self.hitsArray[indexPath.row]
        postCell?.toggleSwitchState = {(postList) -> () in
           self.hitsArray[indexPath.row] = postList
           self.viewModal.prepareNavigationBar()
        }
        return postCell!
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row  == self.hitsArray.count - 1 {
            viewModal.paginationTable()
        }
    }
    
}
