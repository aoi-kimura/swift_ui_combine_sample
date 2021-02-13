//
//  SearchViewModel.swift
//  swift_ui_combine_sample
//
//  Created by 木村葵 on 2020/09/22.
//

import Foundation
import Combine

class SearchViewModel : ObservableObject, Identifiable {
    
    var searchWord: String = "" {
        didSet {
            search(text: searchWord)
        }
    }
    
    var requestCancellable: Cancellable?
    
    @Published var items: [Item] = []
    
    /**
     Qiita検索
     */
    func search(text: String) {
        self.requestCancellable = ItemsRequest(text: text)
                    .publisher
                    .sink(receiveCompletion: { (completion) in
                        switch completion {
                        case .finished:
                            break
                        case .failure( _):
                            break
                        }

                    }) { (entity) in
                        self.items = entity
                    }
    }
    
    func cancel() {
        self.requestCancellable?.cancel()
        self.requestCancellable = nil
    }
    
}
