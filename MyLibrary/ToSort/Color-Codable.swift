//
//  File.swift
//  
//
//  Created by Timothy Bryant on 1/12/23.
//

/// This extensions was written by Paul Hudson and appears in Project 13: Screenable of his book
/// Hacking with macOS. It allows you to add SwiftUI Colors to a struct that conforms to the Codable
/// protocol.

import SwiftUI

extension Color: Codable {
    
    enum CodingKeys: CodingKey {
        case red, green, blue, alpha
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let r = try container.decode(Double.self, forKey: .red)
        let g = try container.decode(Double.self, forKey: .green)
        let b = try container.decode(Double.self, forKey: .blue)
        let a = try container.decode(Double.self, forKey: .alpha)
        
        self.init(red: r, green: g, blue: b, opacity: a)
    }
    
    func getComponents() -> (red: Double, green: Double, blue: Double, alpha: Double) {
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0
        
        let color = NSColor(self)
        color.getRed(&r, green: &g, blue: &b, alpha: &a)
        
        return (r, g, b, a)
    }
    
    public func encode(to encoder: Encoder) throws {
        let components = getComponents()
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(components.red, forKey: .red)
        try container.encode(components.green, forKey: .green)
        try container.encode(components.blue, forKey: .blue)
        try container.encode(components.alpha, forKey: .alpha)
    }
    
}
