//
//  StudyTimeCheckWidgetLiveActivity.swift
//  StudyTimeCheckWidget
//
//  Created by EUNSUNG on 11/26/24.
//

import ActivityKit
import WidgetKit
import SwiftUI
import AppIntents

@available(iOS 16.0, macOS 13.0, watchOS 9.0, tvOS 16.0, *)
struct SuperCharge: LiveActivityIntent {
    
    static var title: LocalizedStringResource = "Emoji Ranger SuperCharger"
    static var description = IntentDescription("All heroes get instant 100% health.")
    
    func perform() async throws -> some IntentResult {
        // EmojiRanger.superchargeHeros()
        print("perform")
        LiveActivityManager.shared.update(state: StudyTimeCheckWidgetAttributes.ContentState(timer: 30))
        return .result()
    }
}



struct StudyTimeCheckWidgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var timer: Int
    }

    // Fixed non-changing properties about your activity go here!
    var goal: String
}

struct StudyTimeCheckWidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: StudyTimeCheckWidgetAttributes.self) { context in
            // Lock screen/banner UI goes here
            HStack {
                
                let startTime = Calendar.current.date(byAdding: .day, value: -1, to: Date())! // 어제 시간
                let timerRange = startTime...Date().addingTimeInterval(TimeInterval(context.state.timer))

//                let timerRange = Date()...Date().addingTimeInterval(TimeInterval(context.state.timer))
                
                
                Spacer()
                Text("\(context.attributes.goal)")
                Text(timerInterval: timerRange)
                Spacer()
                if #available(iOS 17.0, *) {
                    Button(intent: SuperCharge()) {
                        Image(systemName: "play.circle.fill")
                    }
                    .buttonStyle(BorderlessButtonStyle())
                    .foregroundColor(.black)
                    .font(.system(size: 40))
                    Button(intent: SuperCharge()) {
                        Image(systemName: "pause.circle.fill")
                    }
                    .buttonStyle(BorderlessButtonStyle())
                    .foregroundColor(.black)
                    .font(.system(size: 40))
                }
                Spacer()
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                DynamicIslandExpandedRegion(.leading) {
//                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
//                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
//                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
//                Text("L")
            } compactTrailing: {
//                Text("T \(context.state.emoji)")
            } minimal: {
//                Text(context.state.emoji)
            }
        }
    }
}
