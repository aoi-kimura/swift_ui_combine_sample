//
//  HostingControllerView.swift
//  swift_ui_combine_sample
//
//  SwiftUIからUIViewControllerを取得するクラス群
//
//  Created by 木村葵 on 2021/02/13.
//

import SwiftUI

public struct RepresentControllerView: UIViewControllerRepresentable {
    private var uiViewController: UIViewController

    public init(uiViewController: UIViewController) {
        self.uiViewController = uiViewController
    }

    public func makeUIViewController(context: Context) -> UIViewController {
        uiViewController
    }

    public func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
}

public final class HostingController<Content: View>: UIHostingController<Content>, ObservableObject {}

public struct HostingControllerView<Content: View>: View {
    private var c: HostingController<Content>

    public init(rootView: Content) {
        self.c = HostingController(rootView: rootView)
    }

    public var body: some View {
        RepresentControllerView(uiViewController: c).environmentObject(c)
    }
}
