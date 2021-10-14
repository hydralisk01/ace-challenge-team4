//
//  AppDelegate.swift
//  Navigate (iOS)
//
//  Created by Ko, Kenneth on 14/10/21.
//

import UIKit

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        NotificationManager.shared.register()
        Task {
            let granted = await NotificationManager.shared.requestPermission()
            if granted {
                NotificationManager.shared.scheduleNotification()
            }
        }
        return true
    }
}
