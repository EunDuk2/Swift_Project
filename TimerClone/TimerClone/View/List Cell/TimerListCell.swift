//
//  TimerListCell.swift
//  TimerClone
//
//  Created by EUNSUNG on 12/4/24.
//

import SwiftUI

struct TimerListCell: View {
    
    @State private var duration: Int = 1200      // 설정한 타이머 시간 (초 단위)
    @State private var remainingTime: Int = 1200  // 남은 시간
    @State private var isRunning: Bool = false  // 타이머 실행 여부
    @State private var timer: Timer?            // 타이머 객체

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                // 남은 시간 표시
                Text("\(secondsToTimes(from: remainingTime))")
                    .font(.system(size: 60, weight: .thin))
                    .foregroundColor(.gray)
                    
                Text("\(secondsToStringTimes(from: duration))")
                    .foregroundColor(.gray)
                    
            }
            Spacer()
            Button(action: {
                if isRunning {
                    stopTimer()
                } else {
                    startTimer()
                }
            }, label: {
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

    // 타이머 시작
    private func startTimer() {
        isRunning = true
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            if remainingTime > 0 {
                remainingTime -= 1
            } else {
                stopTimer()
            }
        }
    }

    // 타이머 멈춤
    private func stopTimer() {
        isRunning = false
        timer?.invalidate()
        timer = nil
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
