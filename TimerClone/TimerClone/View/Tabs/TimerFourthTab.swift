//
//  TimerFourthTab.swift
//  TimerClone
//
//  Created by EUNSUNG on 12/1/24.
//

import SwiftUI

struct TimerFourthTab: View {
    
    var imageSystemName: String
    var tabName: String
    var tag: Int
    
    var body: some View {
        Text("타이머")
            .tabItem {
                Image(systemName: imageSystemName)
                Text(tabName)
            }
            .tag(tag)
    }
}
