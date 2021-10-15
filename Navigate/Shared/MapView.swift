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
        let vc = UIViewController()
        vc.title = "Map view controller here"
        let navController = UINavigationController(rootViewController: vc)
        navController.title = "Map view controller here"
        return navController
    }

    func updateUIViewController(_ uiViewController: UINavigationController, context: Context) {}
}
