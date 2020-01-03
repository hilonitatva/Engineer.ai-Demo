//
//  PostListingViewModal.swift
//  Engineer.ai Demo
//
//  Created by PCQ177 on 02/01/20.
//  Copyright © 2020 PCQ177. All rights reserved.
//

import UIKit
import SVProgressHUD

class PostListingViewModal: BaseViewModal {

    //MARK:- Variable -
   private var viewController: PostListingViewController!
   private var isLoading = false
   private var hitCount: Int = 0
   private var page: Int = 1
   private var hasMore: Bool = false
    
    init(viewController: PostListingViewController) {
        self.viewController = viewController
    }
    
   lazy var paginationTable: (()->()) = {
        if self.viewController.hitsArray.count < self.viewController.postDetail?.nbHits ?? 0 && self.isLoading == false && self.hasMore == true{
            self.page += 1
            self.viewController.postListingTableView.tableFooterView = self.viewController.tableFooterView
            self.callPostListingAPI(page: self.page)
        }
    }
    
    //MARK:- View Method -
    func preparePostView() {
        viewController.postListingTableView.refreshControl = viewController.refreshController
        self.prepareInitialTableView()
    }
    
    func prepareInitialTableView() {
        self.page = 1
        self.callPostListingAPI(page: self.page)
    }
    
    func prepareNavigationBar() {
        self.hitCount = 0
        for hit in viewController.hitsArray {
            if hit.isActive {
                self.hitCount += 1
            }
        }
        if self.hitCount == 1 {
             viewController.title = "singlePostSelectedMessage".localized
        }else {
            viewController.title = "\("mupltiplePostSelectedMessage".localized)\(self.hitCount)"
        }
    }
    
    //MARK:- Call API -
    func callPostListingAPI(page: Int) {
        self.isLoading = true
        let showIndicator = viewController?.hitsArray.count ?? 0 > 0 ? false : true
        if showIndicator {
            SVProgressHUD.show()
        }
        PostListingInteractor.callPostListingAPI(page: page, completionSucces: { (response) in
              let post = try? JSONDecoder().decode(Post.self, from: response)
              self.viewController.postDetail = post
            if page == 1 {
                self.viewController.hitsArray.removeAll()
            }
            for hit in (self.viewController.postDetail!.hits)! {
                self.viewController.hitsArray.append(hit)
            }
            self.self.isLoading = false
            if page < self.viewController.postDetail?.nbPages ?? 0 {
                self.self.hasMore = true
            }
            self.viewController.postListingTableView.refreshControl?.endRefreshing()
            self.prepareNavigationBar()
            self.viewController.postListingTableView.tableFooterView = nil
            self.viewController.postListingTableView.reloadData()
            SVProgressHUD.dismiss()
        }) { (error) in
           self.viewController.showAlert(message: error)
            SVProgressHUD.dismiss()
        }
    }
}
