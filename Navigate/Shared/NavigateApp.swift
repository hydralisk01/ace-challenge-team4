//
//  NavigateApp.swift
//  Shared
//
//  Created by Peter Huang on 2021/10/14.
//

import SwiftUI

@main
struct NavigateApp: App {

    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
