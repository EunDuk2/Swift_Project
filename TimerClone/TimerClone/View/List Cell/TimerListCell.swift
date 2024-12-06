//
//  TimerListCell.swift
//  TimerClone
//
//  Created by EUNSUNG on 12/4/24.
//

import SwiftUI

struct TimerListCell: View {
    
//    @State private var isOperating: Bool = false // 작동 여부
//    @State private var duration: Int             // 설정한 타이머 시간 (초 단위)
//    @State private var remainingTime: Int        // 남은 시간
//    @State private var isRunning: Bool = false   // 타이머 실행 여부
//    @State private var timer: Timer?             // 타이머 객체
//
//    init(duration: Int) {
//        self.duration = duration
//        self.remainingTime = duration
//    }
//    
//    var body: some View {
//        HStack {
//            VStack(alignment: .leading) {
//                // 남은 시간 표시
//                Text("\(secondsToTimes(from: remainingTime))")
//                    .font(.system(size: 60, weight: .thin))
//                    .foregroundColor(isRunning ? .white : .gray)
//                    
//                Text("\(secondsToStringTimes(from: duration))")
//                    .foregroundColor(isRunning ? .white : .gray)
//                    
//            }
//            Spacer()
//            Button(action: {
//                if isRunning {
//                    stopTimer()
//                } else {
//                    startTimer()
//                }
//            }, label: {
//                isOperating ? Image(systemName: isRunning ? "pause.circle" : "play.circle")
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 65, height: 65)
//                    .symbolRenderingMode(.multicolor)
//                    .foregroundColor(.orange) :
//                Image(systemName: "play.circle.fill")
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 65, height: 65)
//                    .symbolRenderingMode(.hierarchical)
//                    .foregroundColor(.green)
//                
//                
//            })
//            .frame(alignment: .trailing)
//            .buttonStyle(BorderlessButtonStyle())
//        }
//    }
    
    @ObservedObject var timer: TimerModel
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                // 남은 시간 표시
                Text("\(secondsToTimes(from: timer.getRemainingTime()))")
                    .font(.system(size: 60, weight: .thin))
                    .foregroundColor(timer.getIsRunning() ? .white : .gray)

                Text("\(secondsToStringTimes(from: timer.getDuration()))")
                    .foregroundColor(timer.getIsRunning() ? .white : .gray)

            }
            Spacer()
            Button(action: {
                // 여기가 문제네..
                // 타이머 타입에 따라 액션이 달라짐
                // isOperating = true
                // timer start, stop
                // isOperating = false
                // operatingTimer append
                
                if timer.getIsOperating() {
                    if timer.getIsRunning() {
                        timer.stopTimer()
                    } else {
                        timer.startTimer()
                    }
                } else {
                    
                }
                
            }, label: {
                timer.getIsOperating() ? Image(systemName: timer.getIsRunning() ? "pause.circle" : "play.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 65, height: 65)
                    .symbolRenderingMode(.multicolor)
                    .foregroundColor(.orange) :
                Image(systemName: "play.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 65, height: 65)
                    .symbolRenderingMode(.hierarchical)
                    .foregroundColor(.green)

            })
            .frame(alignment: .trailing)
            .buttonStyle(BorderlessButtonStyle())
        }
    }


    // 시간 포맷: 초 -> "분:초" 변환
    private func secondsToTimes(from seconds: Int) -> String {
        let hours = seconds / 3600
        let minutes = (seconds % 3600) / 60
        let seconds = seconds % 60
        
        if hours == 0 {
            return String(format: "%02d:%02d", minutes, seconds)
        } else if hours == 0 && minutes == 0 {
            return String(format: "%02d:%02d", minutes, seconds)
        } else {
            return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
        }
    }
    // 시간 포맷: 초 -> "시간 분 초"로 변환
    private func secondsToStringTimes(from seconds: Int) -> String {
        let hours = seconds / 3600
        let minutes = (seconds % 3600) / 60
        let seconds = seconds % 60
        
        if hours == 0 && minutes == 0 {
            return "\(seconds)초"
        } else if hours == 0 && seconds == 0 {
            return "\(minutes)분"
        } else if minutes == 0 && seconds == 0 {
            return "\(hours)시간"
        } else if hours == 0 {
            return "\(minutes)분 \(seconds)초"
        } else if minutes == 0 {
            return "\(hours)시간 \(seconds)초"
        } else if seconds == 0 {
            return "\(hours)시간 \(minutes)분"
        } else {
            return "\(hours)시간 \(minutes)분 \(seconds)초"
        }
    }
}
