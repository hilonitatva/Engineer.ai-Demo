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
        viewController.postListingTableView.refreshControl = viewController.refreshController
        self.prepareInitialTableView()
    }
    
    func prepareInitialTableView() {
        viewController.page = 1
        self.callPostListingAPI(page: viewController.page)
    }
    
    func prepareNavigationBar() {
        viewController.hitCount = 0
        for hit in viewController.hitsArray {
            if hit.isActive {
                viewController.hitCount += 1
            }
        }
        if viewController.hitCount == 1 {
             viewController.title = "Number of Selected Post : \(viewController.hitCount)"
        }else {
            viewController.title = "Number of Selected Posts : \(viewController.hitCount)"
        }
    }
    
    //MARK:- Call API -
    func callPostListingAPI(page: Int) {
        viewController.isLoading = true
        let showIndicator = viewController?.hitsArray.count ?? 0 > 0 ? false : true
        PostListingInteractor.callPostListingAPI(showIndicator: showIndicator,page: page, completionSucces: { (response) in
              let post = try? JSONDecoder().decode(Post.self, from: response)
              self.viewController.postDetail = post
            if page == 1 {
                self.viewController.hitsArray.removeAll()
            }
            for hit in (self.viewController.postDetail!.hits)! {
                self.viewController.hitsArray.append(hit)
            }
            self.viewController.isLoading = false
            self.viewController.postListingTableView.refreshControl?.endRefreshing()
            self.prepareNavigationBar()
            self.viewController.postListingTableView.tableFooterView = nil
            self.viewController.postListingTableView.reloadData()
        }) { (error) in
           let alert = UIAlertController(title: "Engineer AI Demo", message: error, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
            self.viewController.present(alert,animated: true,completion: nil)
        }
    }
}
