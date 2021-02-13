//
//  EntityDataParser.swift
//  swift_ui_combine_sample
//
//  Created by 木村葵 on 2021/02/13.
//

import APIKit
import Foundation

final class EntityDataParser<T: Decodable>: APIKit.DataParser {
    var contentType: String? {
        return "application/json"
    }

    func parse(data: Data) throws -> Any {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return try decoder.decode(T.self, from: data)
    }
}
