//
//  ContentView.swift
//  TimerClone
//
//  Created by EUNSUNG on 11/30/24.
//

import SwiftUI

struct ContentView: View {
    
    
    @State private var selection = 4
    
    var body: some View {
        TabView(selection: $selection) {
            WorldClockFirstTab(imageSystemName: "globe", tabName: "세계 시계", tag: 1)
            AlarmSecondTab(imageSystemName: "alarm.fill", tabName: "알람", tag: 2)
            StopWatchThirdTab(imageSystemName: "stopwatch.fill", tabName: "스톱워치", tag: 3)
            TimerFourthTab(imageSystemName: "timer", tabName: "타이머", tag: 4)
        }
        .accentColor(.orange)
    }
}


//#Preview {
//    ContentView()
//}
