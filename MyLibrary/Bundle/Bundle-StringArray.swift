//
//  File.swift
//  
//
//  Created by Timothy Bryant on 1/12/23.
//

/// This extensions was written by Paul Hudson and appears in Project 13: Screenable of his book
/// Hacking with macOS. It allows you to import a text file into your project and then will parse the text
/// on each line into an array of elements.
///
/// ```
/// let array = Bundle.main.loadStringArray(from: "Fonts.txt")
/// ```
///
///  - Parameters:
///     - file: a string representing the name of the text file.

import Foundation

extension Bundle {
    func loadStringArray(from file: String) -> [String] {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }
        
        guard let string = try? String(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }
        
        return string.trimmingCharacters(in: .whitespacesAndNewlines).components(separatedBy: .newlines)
    }
}
