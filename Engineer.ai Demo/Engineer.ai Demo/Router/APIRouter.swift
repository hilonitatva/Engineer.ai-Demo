//
//  APIRouter.swift
//  Engineer.ai Demo
//
//  Created by PCQ177 on 02/01/20.
//  Copyright © 2020 PCQ177. All rights reserved.
//

import Foundation
import Alamofire

protocol Router {
    var path        : String      { get }
    var method      : HTTPMethod  { get }
    var parameter   : Parameters  { get }
}

enum APIRouter: Router {
    
    case callPost(Int)
    
}
extension APIRouter {
    var path: String {
        switch self {
        case .callPost(let page):
            return Environment + "v1/search_by_date?tags=story&page=\(page)"
        }
    }
}
extension APIRouter {
    var method: HTTPMethod {
        switch self {
        case .callPost:
            return .get
        }
    }
}
extension APIRouter {
    var parameter: Parameters {
        switch self {
        case .callPost(let page):
            return [:]
        }
    }
}
