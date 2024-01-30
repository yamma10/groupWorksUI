//
//  TabView.swift
//  GroupWorks
//
//  Created by 大島大和 on 2024/01/25.
//

import SwiftUI

struct TaView: View {
    var body: some View {
        TabView {
            Text("Tab 1")
                .tabItem {
                    Label("ホーム", systemImage: "house")
                }
            Text("Tab 2")
                .tabItem {
                    Label("トーク", systemImage: "bubble.left.and.text.bubble.right")
                }
            Text("Tab 3")
                .tabItem {
                    Label("タイムライン", systemImage: "clock")
                }
        }
    }
}

#Preview {
    TaView()
}
