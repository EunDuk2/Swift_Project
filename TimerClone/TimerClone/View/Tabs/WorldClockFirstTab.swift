//
//  WorldClockFirstTab.swift
//  TimerClone
//
//  Created by EUNSUNG on 12/1/24.
//

import SwiftUI

struct WorldClockFirstTab: View {
    
    var imageSystemName: String
    var tabName: String
    var tag: Int
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                ForEach(0..<50, id: \.self) { i in
                    Text("Item \(i)")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.gray.opacity(0.3))
                        .cornerRadius(10)
                        .padding(.horizontal)
                }
            }
        }
            .tabItem {
                Image(systemName: imageSystemName)
                Text(tabName)
            }
            .tag(tag)
    }
}
