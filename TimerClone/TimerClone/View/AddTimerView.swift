//
//  AddTimerView.swift
//  TimerClone
//
//  Created by EUNSUNG on 12/9/24.
//

import SwiftUI

struct AddTimerView: View {
    
    @Binding var isPresent: Bool
    
    @State private var hours = 0
    @State private var minutes = 0
    @State private var seconds = 0
    
    @State private var text: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                // time picker (wheel)
                // form? (Picker + list)
                // section + button collection list
                // section + table list
                
                HStack {
                    Picker("Hours", selection: $hours) {
                        ForEach(0..<24) { hour in
                            Text("\(hour)").tag(hour)
                        }
                    }
                    .pickerStyle(.wheel)
                    .frame(width: 80)
                    .clipped()
                    Text("시간").bold()
                    Picker("Minutes", selection: $minutes) {
                        ForEach(0..<60) { minuete in
                            Text("\(minuete)").tag(minuete)
                        }
                    }
                    .pickerStyle(.wheel)
                    .frame(width: 80)
                    .clipped()
                    Text("분").bold()
                    Picker("Seconds", selection: $seconds) {
                        ForEach(0..<60) { second in
                            Text("\(second)").tag(second)
                        }
                    }
                    .pickerStyle(.wheel)
                    .frame(width: 80)
                    .clipped()
                    Text("초").bold()
                }
                
                List {
                    HStack {
                        Text("레이블")
                        Spacer()
                        TextField(text: $text, label: {
                            Text("타이머")
                        })
                        .multilineTextAlignment(.trailing)
                        
                    }
                    NavigationLink(destination: Text("녹차")) {
                        HStack {
                            Text("타이머 종료 시")
                            Spacer()
                            Text("녹차").foregroundColor(.gray)
                        }
                    }
                }
                .listStyle(.insetGrouped)
                
                
                
                Text("Add  Timer View")
                
            }
            .navigationTitle(Text("타이머"))
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading: Button(action: {
                isPresent = false
            }, label: {
                Text("취소")
            }), trailing: Button(action: {
                isPresent = false
            }, label: {
                Text("시작")
            }))
        }
        .accentColor(.orange)
        
    }
}
