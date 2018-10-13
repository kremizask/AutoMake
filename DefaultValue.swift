//
//  DefaultValue.swift
//
//  Created by Kostas Kremizas on 13/10/2018.
//  Copyright © 2018 kremizas. All rights reserved.
//

import Foundation
import UIKit

protocol AutoMake {}

extension Int {
    static var defaultValue: Int { return 0 }
}

extension String {
    static var defaultValue: String { return "Default string" }
}

extension URL {
    static var defaultValue: URL {
        return URL(string: "https://google.com")!
     }
}

extension Array {
    static var defaultValue: Array {
        return Array()
    }
}

extension Optional {
    static var defaultValue: Optional {
        return nil
    }
}

extension CGPoint {
    static var defaultValue: CGPoint { return .zero }
}

extension Double {
    static var defaultValue: Double { return 0.0 }
}

extension Bool {
    static var defaultValue: Bool { return false }
}

extension Date {
    static var defaultValue: Date { return Date() }
}
