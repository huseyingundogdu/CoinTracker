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
                Image(systemName: isUp ? "arrowtriangle.up.fill" : "arrowtriangle.down.fill")
                    .font(.subheadline)
            }
        }
    }
}

#Preview {
    CustomListSortButton(title: "Button")
}
