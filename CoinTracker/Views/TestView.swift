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
        ZStack {
            Color.theme.background
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                Text("Green Color")
                    .foregroundStyle(Color.theme.green)
                
                Text("Red Color")
                    .foregroundStyle(Color.theme.red)
                
                Text("Text Color")
                    .foregroundStyle(Color.theme.textColor)
                
            }
            .font(.title)
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
