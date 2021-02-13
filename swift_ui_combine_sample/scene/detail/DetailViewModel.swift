//
//  DetailViewModel.swift
//  swift_ui_combine_sample
//
//  Created by 木村葵 on 2021/02/13.
//

import Foundation

class DetailViewModel : ObservableObject, Identifiable {
    
    let item: Item
    
    init(item: Item) {
        self.item = item
    }
}
