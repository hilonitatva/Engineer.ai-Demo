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
    @IBOutlet weak var postListingTableView     : UITableView!
    
    //MARK:- Variable -
    lazy var viewModal              : PostListingViewModal          = PostListingViewModal(viewController: self)
    lazy var viewNavigator          : PostListingViewNavigator      = PostListingViewNavigator(viewController: self)
    
    //MARK:- Controller Method -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.prepareView()
        // Do any additional setup after loading the view.
    }
    
    //MARK:- View Method -
    private func prepareView() {
        viewModal.preparePostView()
    }

}
//NARK:- Table View Delegate & DataSource -
extension PostListingViewController: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let postCell = tableView.dequeueReusableCell(withIdentifier: String(describing: PostListingTableViewCell.self)) as! PostListingTableViewCell
        return postCell
    }
    
    
}
