//
//  TimerListCell.swift
//  TimerClone
//
//  Created by EUNSUNG on 12/4/24.
//

import SwiftUI

struct TimerListCell: View {
    @ObservedObject var timer: TimerModel
    var timerViewModel: TimerViewModel?
    
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
                // 버튼 액션에 관해서..
                // 아래 로직들은 여기에 있으면 안 됨
                // 모델이나 뷰모델의 단순 buttonAction() 이런 함수만 발동해야함
                
                
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
                    // 누르면, 뷰모델의 appendOperatingTimer함수 발동
                    // 인자로 현재 self 모델 전달
                    // 그대로 저장해서 전달하면, 같은 참조로 동기화가 됨
                    // 새로 만들어서 필요한 값만 맞춰줌
                    let newTimer: TimerModel = TimerModel(isOperating: true, duration: self.timer.getDuration(), remainingTime: self.timer.getRemainingTime())
                    
                    timerViewModel?.appendOperatingTimer(timer: newTimer)
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
