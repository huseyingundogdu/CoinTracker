//
//  TestView.swift
//  CoinTracker
//
//  Created by Huseyin on 26/09/2024.
//

import SwiftUI

struct TestView: View {
    @Environment(Router.self) private var router
    var body: some View {
        VStack {
            Text("Hello, World!")
        }
        .onAppear {
            print("test")
        }
    }
}

#Preview {
    TestView()
        .environment(Router())
}
