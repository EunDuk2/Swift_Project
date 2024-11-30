//
//  ContentView.swift
//  StudyTimeCheck
//
//  Created by EUNSUNG on 11/26/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Button(action: {
                start()
            }, label: {
                Text("start")
            })
            Button(action: {
                update()
            }, label: {
                Text("update")
            })
        }
        .padding()
    }
    
    func start() {
        LiveActivityManager.shared.start(goal: "개발 공부", timer: 1800)
    }
    func update() {
        LiveActivityManager.shared.update(state: StudyTimeCheckWidgetAttributes.ContentState(timer: 30))
    }
}

#Preview {
    ContentView()
}
