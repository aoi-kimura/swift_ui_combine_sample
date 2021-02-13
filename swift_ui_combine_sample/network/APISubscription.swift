//
//  APISubscription.swift
//  swift_ui_combine_sample
//
//  Created by 木村葵 on 2021/02/13.
//

import Foundation
import APIKit
import Combine

struct APISubscription: Subscription {

    let combineIdentifier: CombineIdentifier
    // APIPublisherから通信に使ったインスタンスをもらって保持する
    let task: APIKit.SessionTask?

    func request(_ demand: Subscribers.Demand) {}

    func cancel() {
        // 通信をキャンセルする
        self.task?.cancel()
    }
}
