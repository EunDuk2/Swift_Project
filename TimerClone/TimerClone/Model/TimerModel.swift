//
//  Timer.swift
//  TimerClone
//
//  Created by EUNSUNG on 12/5/24.
//

import Foundation

class TimerModel: Identifiable, ObservableObject {
    private let isOperating: Bool
    @Published private var duration: Int // 설정한 타이머 시간 (초 단위)
    @Published private var remainingTime: Int // 남은 시간
    @Published private var isRunning: Bool // 타이머 실행 여부
    
    private var timer: Timer?
    
    init(isOperating: Bool, duration: Int, remainingTime: Int, isRunning: Bool = false) {
        self.isOperating = isOperating
        self.duration = duration
        self.remainingTime = remainingTime
        self.isRunning = isRunning
    }
    
    func getIsOperating() -> Bool {
        return self.isOperating
    }
    func getDuration() -> Int {
        return self.duration
    }
    func getRemainingTime() -> Int {
        return self.remainingTime
    }
    func getIsRunning() -> Bool {
        return self.isRunning
    }
    
    // 타이머 시작
    func startTimer() {
        isRunning = true
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            if self.remainingTime > 0 {
                self.remainingTime -= 1
                print(self.remainingTime)
                print(self.isRunning)
            } else {
                self.stopTimer()
            }
        }
    }
    
    func stopTimer() {
        isRunning = false
        timer?.invalidate()
        timer = nil
    }
}
