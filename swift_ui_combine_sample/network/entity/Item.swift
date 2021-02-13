//
//  Item.swift
//  swift_ui_combine_sample
//
//  Created by 木村葵 on 2021/02/13.
//

import Foundation

struct Item: Decodable, Hashable {
    let id: String
    let body: String
    let createdAt: String
    let title: String
    let url: String
}
