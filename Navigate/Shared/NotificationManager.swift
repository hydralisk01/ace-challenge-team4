//
//  NotificationManager.swift
//  Navigate (iOS)
//
//  Created by Ko, Kenneth on 14/10/21.
//

import UserNotifications

@objc
class NotificationManager: NSObject, UNUserNotificationCenterDelegate {

    private enum Identifer {
        static let category = "ARRIVAL"
        static let goToDesk = "ACTION_GoToDesk"
        static let findColleague = "ACTION_FindAColleague"
    }

    static let shared = NotificationManager()

    var notificationCenter: UNUserNotificationCenter {
        return UNUserNotificationCenter.current()
    }

    func requestPermission() async -> Bool {
        do {
            let granted = try await notificationCenter.requestAuthorization(options: [.alert, .sound, .badge])
            print("Permission granted")
            return granted
        } catch {
            print("Error when trying to request authorization: \(error)")
            return false
        }
    }

    func register() {
        let goToDeskAction = UNNotificationAction(
            identifier: Identifer.goToDesk,
            title: "Take me to my desk",
            options: UNNotificationActionOptions.foreground)
        let findColleagueAction = UNNotificationAction(
            identifier: Identifer.findColleague,
            title: "Find a colleague",
            options: UNNotificationActionOptions.foreground)
        let arrivalCategory = UNNotificationCategory(
            identifier: Identifer.category,
            actions: [goToDeskAction, findColleagueAction],
            intentIdentifiers: [],
            hiddenPreviewsBodyPlaceholder: "",
            options: [])
        notificationCenter.setNotificationCategories([arrivalCategory])
        notificationCenter.delegate = self
    }

    func scheduleNotification() {
        let userInfo = [String: Any]()
        let bodyString = "hello!!!"

        let content = UNMutableNotificationContent()
        content.body = bodyString
        content.categoryIdentifier = Identifer.category
        content.userInfo = userInfo

        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5.0, repeats: false)
        let request = UNNotificationRequest(identifier: "test_local_notification", content: content, trigger: trigger)

        notificationCenter.add(request) { (error) in
            if let error = error {
                print("Unable to Add Notification Request (\(error), \(error.localizedDescription))")
            }
        }
    }

    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.badge, .sound, .banner, .list])
    }

    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        switch response.actionIdentifier {
        case Identifer.goToDesk:
            print("goToDesk")
        case Identifer.findColleague:
            print("findColleague")
        default:
            print("Other Action")
        }
        completionHandler()
    }
}
