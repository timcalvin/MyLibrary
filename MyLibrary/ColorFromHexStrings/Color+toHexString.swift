//
//  Color+Extension.swift
//  MyBooks
//
//  Created by Timothy Bryant on 4/4/24.
//
//  Adapted from Max Alexander's code at: https://ditto.live/blog/swift-hex-color-extension

import SwiftUI

extension Color {
    
    /// Initializes a new Color instance from a hex string
    /// - Parameter hex: Hex color code string
    init?(hex: String) {
        guard let uiColor = UIColor(hex: hex) else { return nil }
        self.init(uiColor: uiColor)
    }
    
    /// Returns a hex string representation of the Color instance
    /// - Parameter includeAlpha: Should the hex representation include alpha value
    /// - Returns: Hex string representing Color
    func toHexString(includeAlpha: Bool = false) -> String? {
        return UIColor(self).toHexString(includeAlpha: includeAlpha)
    }
    
}
