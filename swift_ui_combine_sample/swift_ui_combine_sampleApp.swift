//
//  swift_ui_combine_sampleApp.swift
//  swift_ui_combine_sample
//
//  Created by 木村葵 on 2020/09/22.
//

import SwiftUI

@main
struct swift_ui_combine_sampleApp: App {
    var body: some Scene {
        WindowGroup {
            SearchView(viewModel: SearchViewModel())
        }
    }
}

struct swift_ui_combine_sampleApp_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
