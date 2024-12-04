//
//  TimerFourthTab.swift
//  TimerClone
//
//  Created by EUNSUNG on 12/1/24.
//

import SwiftUI

struct TimerFourthTab: View {
    
    @Environment(\.editMode) private var editMode
    @State private var isEditing = false
    
    var imageSystemName: String
    var tabName: String
    var tag: Int
    
    var body: some View {
        NavigationView {
            VStack {
                Text("타이머")
            }
                .navigationTitle(Text("타이머"))
                .navigationBarItems(leading: Button(action: {
                    isEditing.toggle()
                    editMode?.wrappedValue = isEditing ? .active : .inactive
                    // 편집 버튼 액션
                }, label: {
                    isEditing ? Text("완료").bold() : Text("편집")
                }), trailing: Button(action: {
                    // + 버튼 액션
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
