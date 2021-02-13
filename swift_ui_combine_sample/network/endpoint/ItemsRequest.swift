//
//  ItemsRequest.swift
//  swift_ui_combine_sample
//
//  Created by 木村葵 on 2021/02/13.
//

import Foundation
import APIKit

struct ItemsRequest: APIKit.Request {
    
    var method: HTTPMethod = .get
    
    var path: String = "/api/v2/items"
    
    var parameters: Any? {
        return ["page": 1, "per_page": 20, "query": text]
    }
    
    let text: String
    
    typealias Response = [Item]
    
}
