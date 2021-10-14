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
    func makeUIViewController(context: Context) -> UIViewController {
        return WelcomeViewController()
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
}
