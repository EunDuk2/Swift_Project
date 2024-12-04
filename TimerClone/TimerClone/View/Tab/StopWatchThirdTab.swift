//
//  StopWatchThirdTab.swift
//  TimerClone
//
//  Created by EUNSUNG on 12/1/24.
//

import SwiftUI

struct StopWatchThirdTab: View {
    
    var imageSystemName: String
    var tabName: String
    var tag: Int
    
    var body: some View {
        Text("스톱워치")
            .tabItem {
                Image(systemName: imageSystemName)
                Text(tabName)
            }
            .tag(tag)
    }
}
