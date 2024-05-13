//
//  ProfileImageSize.swift
//  MyLibrary
//
//  Created by Tim Bryant on 5/13/24.
//

import Foundation

enum ProfileImageSize {
    case xSmall
    case small
    case sMedium
    case medium
    case large
    case xLarge
    
    var dimension: CGFloat {
        switch self {
        case .xSmall:
            return 24
        case .small:
            return 48
        case .sMedium:
            return 36
        case .medium:
            return 64
        case .large:
            return 80
        case .xLarge:
            return 120
        }
    }
}
