//
//  AsyncAwaitTutorialTestApp.swift
//  AsyncAwaitTutorialTest
//
//  Created by Jeff Jeong on 2022/03/11.
//

import SwiftUI

@main
struct AsyncAwaitTutorialTestApp: App {
    var body: some Scene {
        WindowGroup {
            
            TabView {
                ContentView()
                    .badge(10)
                    .tabItem {
                        Image(systemName: "1.square.fill")
                        Text("First")
                    }
                AsyncAwaitTestView()
                    .tabItem {
                        Image(systemName: "2.square.fill")
                        Text("Second")
                    }
            }
            .font(.headline)
        }
    }
}
