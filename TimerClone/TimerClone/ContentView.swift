//
//  ContentView.swift
//  TimerClone
//
//  Created by EUNSUNG on 11/30/24.
//

import SwiftUI

struct ContentView: View {
    
    
    @State private var selection = 1
    
    var body: some View {
        TabView(selection: $selection) {
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
                    Image(systemName: "globe")
                    Text("세계 시계")
                }
                    .tag(1)
            Text("알람")
                .tabItem {
                    Image(systemName: "alarm.fill")
                    Text("알람")
                }
                .tag(2)
            Text("스톱워치")
                .tabItem {
                    Image(systemName: "stopwatch.fill")
                    Text("스톱워치")
                }
                .tag(3)
            Text("타이머")
                .tabItem {
                    Image(systemName: "timer")
                    Text("타이머")
                }
                .tag(4)
        }
        .accentColor(.orange)
    }
}

#Preview {
    ContentView()
}
