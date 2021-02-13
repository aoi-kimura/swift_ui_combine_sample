//
//  APIKitRequest+Parser.swift
//  swift_ui_combine_sample
//
//  Created by 木村葵 on 2021/02/13.
//

import Foundation
import APIKit

extension APIKit.Request where Self.Response: Decodable {
    
    var publisher: APIPublisher<Self> {
        return APIPublisher(request: self)
    }

    var dataParser: APIKit.DataParser {
        return EntityDataParser<Response>()
    }

    func response(from object: Any, urlResponse: HTTPURLResponse) throws -> Response {
        guard let entity = object as? Response else {
            throw ResponseError.unexpectedObject(object)
        }
        return entity
    }
}
