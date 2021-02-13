//
//  APIPublisher.swift
//  swift_ui_combine_sample
//
//  Created by 木村葵 on 2021/02/13.
//

import Foundation
import APIKit
import Combine

struct APIPublisher<R: APIKit.Request>: Publisher where R.Response: Decodable {

    typealias Output = R.Response
    typealias Failure = Error

    let request: R

    func receive<S>(subscriber: S) where S : Subscriber, Failure == S.Failure, Output == S.Input {
        let task = Session
            .shared
            .send(request) { result in
                switch result {
                case .success(let res):
                    let _ = subscriber.receive(res)
                    subscriber.receive(completion: .finished)
                case .failure(let error):
                    subscriber.receive(completion: .failure(error))
                }
        }

        let subscription = APISubscription(combineIdentifier: CombineIdentifier(), task: task)
        subscriber.receive(subscription: subscription)
    }
}
