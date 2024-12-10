//
//  TimerFourthTab.swift
//  TimerClone
//
//  Created by EUNSUNG on 12/1/24.
//

import SwiftUI

struct TimerFourthTab: View {
    // 뷰모델 선언
    @ObservedObject var viewModel = TimerViewModel(operatingTimers: [TimerModel(isOperating: true, duration: 3532, remainingTime: 3532)], recentTimers: [TimerModel(isOperating: false, duration: 3532, remainingTime: 3532)])
    
    @Environment(\.editMode) private var editMode
    @State private var isEditing = false
    @State private var isAddSheetPresent = true
    
    var imageSystemName: String
    var tabName: String
    var tag: Int
    
    var body: some View {
        NavigationView {
            List {
                // 실행 타이머
                Section {
                    ForEach(viewModel.operatingTimers) { timer in
                        TimerListCell(timer: timer)
                    }
                }
                // 최근 항목 타이머
                Section(header: Text("최근 항목").font(.title2).bold().foregroundStyle(.white)) {
                    ForEach(viewModel.recentTimers) { timer in
                        TimerListCell(timer: timer, timerViewModel: self.viewModel)
                    }
                }
                
            }
            .listStyle(.plain)
                .navigationTitle(Text("타이머"))
                .navigationBarItems(leading: Button(action: {
                    isEditing.toggle()
                    editMode?.wrappedValue = isEditing ? .active : .inactive
                    // 편집 버튼 액션
                }, label: {
                    isEditing ? Text("완료").bold() : Text("편집")
                })
                    .sheet(isPresented: $isAddSheetPresent) {
                        
                        AddTimerView(isPresent: $isAddSheetPresent)
                        
                        
                    }, trailing: Button(action: {
                    // + 버튼 액션
                    
                    self.isAddSheetPresent.toggle()
                    
//                    viewModel.appendOperatingTimer(timer: TimerModel(isOperating: true, duration: 7321, remainingTime: 7321))
//                    viewModel.appendRecentTimer(timer: TimerModel(isOperating: false, duration: 7321, remainingTime: 7321))
                }, label: {
                    Image(systemName: "plus")
                }))
        }
            .tabItem {
                Image(systemName: imageSystemName)
                Text(tabName)
            }
            .tag(tag)
    }
}
