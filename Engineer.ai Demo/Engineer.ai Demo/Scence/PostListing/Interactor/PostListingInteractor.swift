//
//  PostListingInteractor.swift
//  Engineer.ai Demo
//
//  Created by PCQ177 on 02/01/20.
//  Copyright © 2020 PCQ177. All rights reserved.
//

import Foundation

class PostListingInteractor {
    
    static func callPostListingAPI(page: Int,completionSucces: @escaping (Data) -> (),failure: @escaping (String)->()) {
        APIManager.callRequest( APIRouter.callPost(page), completionSuccess: { (response) in
            completionSucces(response)
        }) { (error) in
            failure(error)
        }
    }
}
