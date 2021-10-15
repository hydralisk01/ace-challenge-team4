//
//  NavigateApp.swift
//  Shared
//
//  Created by Peter Huang on 2021/10/14.
//

import SwiftUI

class NavModel: ObservableObject {
    static let shared = NavModel()
    @Published var isBooking: Bool = true
}

@main
struct NavigateApp: App {

    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            RootView()
        }
    }
}

struct RootView: View {

    @ObservedObject private var navModel = NavModel.shared

    var body: some View {
        if navModel.isBooking {
            ContentView()
        } else {
            MapView()
        }
    }
}
