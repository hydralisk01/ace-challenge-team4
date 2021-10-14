//
//  ContentView.swift
//  Shared
//
//  Created by Peter Huang on 2021/10/14.
//

import UIKit
import SwiftUI

struct ContentView: View {
    var body: some View {
        WelcomeScreen()
    }
}

struct WelcomeScreen: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UINavigationController {
        let navController = UINavigationController(rootViewController: WelcomeViewController())
        return navController
    }
    
    func updateUIViewController(_ uiViewController: UINavigationController, context: Context) {}
}
