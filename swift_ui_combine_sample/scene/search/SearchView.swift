//
//  ContentView.swift
//  swift_ui_combine_sample
//
//  Created by 木村葵 on 2020/09/22.
//

import SwiftUI

struct SearchView: View {
    @ObservedObject var viewModel: SearchViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("検索", text: $viewModel.searchWord, onEditingChanged: { (changed) in
                            }, onCommit: {
                            })
                .padding(.horizontal)
                
                List(viewModel.items, id: \.self) { item in
                    NavigationLink(destination: DetailView(viewModel: DetailViewModel(item: item))) {
                        Text(item.title)
                    }
                }
            }.onDisappear {
                self.viewModel.cancel()
            }.navigationTitle("Qiita検索")
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    
    class SearchViewModelMock: SearchViewModel {
        
        override init() {
            super.init()
            items = [Item(id: "1",
                           body: "本文1",
                           createdAt: "2021-02-12T23:43:43+09:00",
                           title: "タイトル1",
                           url: "https://qiita.com/MilanistaDev/items/64dca8c9d5099a19529e"),
                      Item(id: "2",
                           body: "本文2",
                           createdAt: "2021-02-12T23:43:43+09:00",
                           title: "タイトル2",
                           url: "https://qiita.com/MilanistaDev/items/64dca8c9d5099a19529e"),
                      Item(id: "3",
                           body: "本文3",
                           createdAt: "2021-02-12T23:43:43+09:00",
                           title: "タイトル3",
                           url: "https://qiita.com/MilanistaDev/items/64dca8c9d5099a19529e")]
        }
    }
    
    static var previews: some View {
        SearchView(viewModel: SearchViewModelMock())
    }
}
