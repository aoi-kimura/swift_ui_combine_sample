//
//  APIKitRequest+Base.swift
//  swift_ui_combine_sample
//
//  Created by 木村葵 on 2021/02/13.
//

import Foundation
import APIKit

extension APIKit.Request {
    
    var baseURL: URL {
        return URL(string: "https://qiita.com")!
    }
}
