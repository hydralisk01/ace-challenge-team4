//
//  WelcomeConfiguration.swift
//  Navigate (iOS)
//
//  Created by Fung, Jessey on 14/10/21.
//

import Foundation

public struct WelcomeConfig {
    let welcomeTitle: String
    let name: String
    let welcomeSubheading: String
    let tableViewRows: [Row]
    
    public struct Row {
        var level: String
        var area: String
        var features: [String]
        var availability: Int
        
        init(level: Level, area: Area, features: [Feature], availability: Int) {
            self.level = level.rawValue
            self.area = area.rawValue
            self.features = features.map { $0.rawValue }
            self.availability = availability
        }
    }
    
    init() {
        welcomeTitle = "Good morning,"
        name = "John ☀️"
        welcomeSubheading = "Where would you like to sit today?"
        tableViewRows = [
            Row(level: .one, area: .north, features: [.singleMonitor, .wheelchairAccessible], availability: 3),
            Row(level: .one, area: .north, features: [.singleMonitor, .heightAdjustable], availability: 2),
            Row(level: .one, area: .north, features: [.singleMonitor, .heightAdjustable, .nearBathrooms], availability: 4),
            Row(level: .one, area: .north, features: [.dualMonitors, .nearLifts, .wheelchairAccessible], availability: 1),
            Row(level: .one, area: .south, features: [.singleMonitor, .nearLifts], availability: 5),
            Row(level: .one, area: .south, features: [.dualMonitors, .wheelchairAccessible, .nearLockers], availability: 2),
            Row(level: .one, area: .east, features: [.dualMonitors], availability: 1),
            Row(level: .one, area: .west, features: [.singleMonitor, .heightAdjustable], availability: 6),
            Row(level: .one, area: .west, features: [.singleMonitor, .singleBooth], availability: 5),
            Row(level: .two, area: .north, features: [.singleMonitor, .nearBathrooms], availability: 3),
            Row(level: .two, area: .north, features: [.singleMonitor, .heightAdjustable], availability: 4),
            Row(level: .two, area: .north, features: [.dualMonitors, .singleBooth], availability: 2),
            Row(level: .two, area: .south, features: [.singleMonitor, .nearLifts, .wheelchairAccessible], availability: 5),
            Row(level: .two, area: .east, features: [.dualMonitors, .heightAdjustable, .nearBathrooms, .nearLifts], availability: 1),
            Row(level: .two, area: .east, features: [.dualMonitors], availability: 2),
            Row(level: .two, area: .west, features: [.singleMonitor, .singleBooth, .nearLifts], availability: 3),
            Row(level: .two, area: .west, features: [.dualMonitors, .wheelchairAccessible, .nearLockers], availability: 4),
            Row(level: .three, area: .north, features: [.singleMonitor, .wheelchairAccessible], availability: 3),
            Row(level: .three, area: .north, features: [.singleMonitor, .heightAdjustable], availability: 5),
            Row(level: .three, area: .north, features: [.singleMonitor, .heightAdjustable, .nearBathrooms], availability: 6),
            Row(level: .three, area: .north, features: [.dualMonitors, .nearLifts, .wheelchairAccessible], availability: 1),
            Row(level: .three, area: .south, features: [.singleMonitor, .nearLifts], availability: 3),
            Row(level: .three, area: .south, features: [.dualMonitors, .wheelchairAccessible, .nearLockers], availability: 2),
            Row(level: .three, area: .east, features: [.dualMonitors], availability: 5),
            Row(level: .three, area: .west, features: [.singleMonitor, .heightAdjustable], availability: 4),
            Row(level: .three, area: .west, features: [.singleMonitor, .singleBooth], availability: 3),
            Row(level: .four, area: .north, features: [.singleMonitor, .nearBathrooms], availability: 3),
            Row(level: .four, area: .north, features: [.singleMonitor, .heightAdjustable], availability: 1),
            Row(level: .four, area: .north, features: [.dualMonitors, .singleBooth], availability: 2),
            Row(level: .four, area: .south, features: [.singleMonitor, .nearLifts, .wheelchairAccessible], availability: 1),
            Row(level: .four, area: .east, features: [.dualMonitors, .heightAdjustable, .nearBathrooms, .nearLifts], availability: 1),
            Row(level: .four, area: .east, features: [.dualMonitors], availability: 3),
            Row(level: .four, area: .west, features: [.singleMonitor, .singleBooth, .nearLifts], availability: 6),
            Row(level: .four, area: .west, features: [.dualMonitors, .wheelchairAccessible, .nearLockers], availability: 4),
            Row(level: .five, area: .north, features: [.singleMonitor, .wheelchairAccessible], availability: 2),
            Row(level: .five, area: .north, features: [.singleMonitor, .heightAdjustable], availability: 2),
            Row(level: .five, area: .north, features: [.singleMonitor, .heightAdjustable, .nearBathrooms], availability: 4),
            Row(level: .five, area: .north, features: [.dualMonitors, .nearLifts, .wheelchairAccessible], availability: 1),
            Row(level: .five, area: .south, features: [.singleMonitor, .nearLifts], availability: 3),
            Row(level: .five, area: .south, features: [.dualMonitors, .wheelchairAccessible, .nearLockers], availability: 3),
            Row(level: .five, area: .east, features: [.dualMonitors], availability: 5),
            Row(level: .five, area: .west, features: [.singleMonitor, .heightAdjustable], availability: 4),
            Row(level: .five, area: .west, features: [.singleMonitor, .singleBooth], availability: 2),
        ]
    }
}

enum Level: String, CaseIterable {
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
}

enum Area: String, CaseIterable {
    case north = "North"
    case south = "South"
    case east = "East"
    case west = "West"
}

enum Feature: String, CaseIterable {
    case singleMonitor = "Single monitor"
    case dualMonitors = "Dual monitors"
    case heightAdjustable = "Height adjustable"
    case singleBooth = "Single booth"
    case wheelchairAccessible = "Wheelchair accessible"
    case nearLifts = "Near lifts"
    case nearBathrooms = "Near bathrooms"
    case nearLockers = "Near lockers"
}
