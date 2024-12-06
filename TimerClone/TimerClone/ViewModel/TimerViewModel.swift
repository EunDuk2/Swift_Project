//
//  TimerViewModel.swift
//  TimerClone
//
//  Created by EUNSUNG on 12/6/24.
//

import SwiftUI

class TimerViewModel: ObservableObject {
    @Published var operatingTimers: [TimerModel]
    @Published var recentTimers: [TimerModel]
    
    init(operatingTimers: [TimerModel], recentTimers: [TimerModel]) {
        self.operatingTimers = operatingTimers
        self.recentTimers = recentTimers
    }
    
    
    func appendOperatingTimer(timer: TimerModel) {
        self.operatingTimers.append(timer)
    }
    
    func appendRecentTimer(timer: TimerModel) {
        self.recentTimers.append(timer)
    }
    
    
}
