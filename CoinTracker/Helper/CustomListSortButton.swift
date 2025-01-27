//
//  CustomListSortButton.swift
//  CoinTracker
//
//  Created by Huseyin on 20/09/2024.
//

import SwiftUI

struct CustomListSortButton: View {
    
    var isSorted: Bool = false
    var isUp: Bool = true
    var title: String
    
    var body: some View {
        HStack {
            Text(title)
                .font(.headline)
            if isSorted {
                Image(systemName: "arrowtriangle.up.fill")
                    // Rotate based on isUp state
                    .rotationEffect(.degrees(isUp ? 0 : 180))
                    // Animation
                    .animation(Animation.easeInOut(duration: 0.7), value: isUp)
                    .font(.subheadline)
            }
        }
    }
}

#Preview {
    CustomListSortButton(title: "Button")
}
