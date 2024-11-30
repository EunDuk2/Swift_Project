//
//  StudyTimeCheckApp.swift
//  StudyTimeCheck
//
//  Created by EUNSUNG on 11/26/24.
//

import SwiftUI

@main
struct StudyTimeCheckApp: App {
    
    @State private var currentURL: URL?
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onOpenURL { url in
                      handleURL(url)
                }
        }
    }
    
    private func handleURL(_ url: URL) {
        if url.scheme == "myapp" {
            print("myapp")
            switch url.host {
            case "action":
                print("Action triggered from Live Activity!")
                // 필요한 작업 실행
            default:
                break
            }
        }
    }
}
