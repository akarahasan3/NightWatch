//
//  NightWatchApp.swift
//  NightWatch
//
//  Created by Ajdin Karahasanovic on 14.07.23.
//

import SwiftUI

@main
struct NightWatchApp: App {
    @StateObject private var nightWatchTasks = NightWatchTasks()
    
    var body: some Scene {
        WindowGroup {
            ContentView(nightWatchTasks: nightWatchTasks)
        }
    }
}
