//
//  MapView.swift
//  Navigate (iOS)
//
//  Created by Ko, Kenneth on 15/10/21.
//

import SwiftUI
import UIKit

struct MapView: View {
    var body: some View {
        MapScreen()
    }
}

struct MapScreen: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UINavigationController {
        let navController = UIStoryboard(name: "BackupMap", bundle: nil).instantiateInitialViewController() as! UINavigationController
        return navController
    }

    func updateUIViewController(_ uiViewController: UINavigationController, context: Context) {}
}

class BackupMapViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            NotificationManager.shared.fireArrivalNotification()
        }
    }
}
