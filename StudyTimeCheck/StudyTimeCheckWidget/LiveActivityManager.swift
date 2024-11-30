//
//  LiveActivityManager.swift
//  StudyTimeCheck
//
//  Created by EUNSUNG on 11/26/24.
//

import SwiftUI
import ActivityKit

@available(iOS 16.2, *) // LiveActivity는 16.2부터 사용가능
final class LiveActivityManager: ObservableObject {
    public static let shared = LiveActivityManager()
  
    @Published var activity: Activity<StudyTimeCheckWidgetAttributes>?
  
    private init() {
        print("LiveActivityManager - (init)")
    }
    
    // 현재 알림센터에 라이브 액티비티가 띄워져 있는지 확인
//    func isEmptyLiveActivity() -> Bool {
//        if Activity<EundukAttributes>.activities.isEmpty {
//            return true
//        } else {
//            return false
//        }
//    }
    
    func start(goal: String, timer: Int) {
        let attributes = StudyTimeCheckWidgetAttributes(goal: goal)
        let contentState = StudyTimeCheckWidgetAttributes.ContentState(timer: timer)
        
        do {
            activity = try Activity<StudyTimeCheckWidgetAttributes>.request(
                attributes: attributes,
                contentState: contentState
            )
        } catch {
            print(error)
        }
    }
    
    
    // 정적/동적 컨트롤들에 들어갈 데이터를 받아 라이브 액티비티 시작
//    func start(timerValue: Int, labelValue: String) {
//        let attributes = EundukAttributes(label: labelValue)
//        let contentState = EundukAttributes.ContentState(timer: timerValue)
//        
//        do {
//          activity = try Activity<EundukAttributes>.request(
//            attributes: attributes,
//            contentState: contentState
//          )
//          print(activity)
//        } catch {
//          print(error)
//        }
//    }
  
    // 동적 변수가 담겨 있는 state중 원하는 변수를 원하는 값으로 업데이트
    func update(state: StudyTimeCheckWidgetAttributes.ContentState) {
        Task {
            let updateContentState = StudyTimeCheckWidgetAttributes.ContentState(timer: state.timer)
            for activity in Activity<StudyTimeCheckWidgetAttributes>.activities {
              await activity.update(using: updateContentState)
            }
        }
//        Task {
//            let updateContentState = EundukAttributes.ContentState(timer: state.timer)
//            for activity in Activity<EundukAttributes>.activities {
//              await activity.update(using: updateContentState)
//            }
//        }
    }
  
    // 라이브 액티비티를 삭제
    func stop() {
//        Task {
//            for activity in Activity<EundukAttributes>.activities {
//            await activity.end(dismissalPolicy: .immediate) // 즉시 종료
//            //await activity.end(dismissalPolicy: .after(<#T##date: Date##Date#>)) // 원하는 시간 뒤에 종료
//            }
//        }
    }
}
