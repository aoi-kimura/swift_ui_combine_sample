//
//  DetailView.swift
//  swift_ui_combine_sample
//
//  Created by 木村葵 on 2021/02/13.
//

import Foundation
import SwiftUI
import SafariServices

struct DetailView: View {
    @ObservedObject var viewModel: DetailViewModel
        
    var body: some View {
        HostingControllerView(rootView: RootView(viewModel: viewModel))
    }
    
}

struct RootView: View {
    
    @ObservedObject var viewModel: DetailViewModel
       
    @EnvironmentObject var viewController: HostingController<RootView>
    
    func showSafariVC() {
        let safari = SFSafariViewController(url: URL(string: viewModel.item.url)!)
        viewController.present(safari, animated: true, completion: nil)
    }
        
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 16) {
                Text(viewModel.item.title).bold()
                VStack(alignment: .leading, spacing: 16, content: {
                    Text(viewModel.item.createdAt)
                    Text(viewModel.item.body)
                }).frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
                Button(action: showSafariVC) {
                    Text("webで見る")
                }
                Spacer()
            }.padding(.horizontal)
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    
    static let mock = Item(id: "1",
                           body: "本文1",
                           createdAt: "2021-02-12T23:43:43+09:00",
                           title: "タイトル1",
                           url: "https://qiita.com/MilanistaDev/items/64dca8c9d5099a19529e")
    
    static var previews: some View {
        DetailView(viewModel: DetailViewModel(item: mock))
    }
}
