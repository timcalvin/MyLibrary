//
//  String-HelperMethods.swift
//  MyLibrary
//
//  Created by Timothy Bryant on 1/12/23.
//

import Foundation

extension String {
    
    /// Determines if a string represents a valid URL.
    ///
    /// ```
    /// String.isValidURL
    /// ```
    /// 
    /// - returns:`Bool`
    /// source: https://stackoverflow.com/questions/28079123/how-to-check-validity-of-url-in-swift
    
    var isValidURL: Bool {
        let detector = try! NSDataDetector(types: NSTextCheckingResult.CheckingType.link.rawValue)
        
        if let match = detector.firstMatch(in: self, options: [], range: NSRange(location: 0, length: self.utf16.count)) {
            // it is a link, if the match covers the whole string
            return match.range.length == self.utf16.count
        } else {
            return false
        }
    }
    
}
