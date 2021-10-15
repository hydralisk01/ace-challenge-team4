//
//  NotificationViewController.swift
//  NotificationContentExtension
//
//  Created by Ko, Kenneth on 14/10/21.
//

import UIKit
import UserNotifications
import UserNotificationsUI

class NotificationViewController: UIViewController, UNNotificationContentExtension {

    @IBOutlet var headingLabel: UILabel!
    @IBOutlet var subheadingLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func didReceive(_ notification: UNNotification) {
        headingLabel.text = "Booking details"
        subheadingLabel?.text = "Desk Lvl 3A 25, 09:00am"
    }

}
