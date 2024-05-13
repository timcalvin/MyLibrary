//
//  Calendar-HelperMethods.swift
//  MyLibrary
//
//  Created by Timothy Bryant on 1/12/23.
//
//  source: https://sarunw.com/posts/getting-number-of-days-between-two-dates/

import Foundation

extension Calendar {
    /// Calculates the time in days between two dates.
    /// - Parameters:
    ///   - from: Starting date as a <Date>
    ///   - to: Ending date as a <Date>
    /// - Returns: Returns an <Int> representing the number of days between the from and to dates.
    func numberOfDaysBetween(_ from: Date, and to: Date) -> Int {
        let fromDate = startOfDay(for: from) // <1>
        let toDate = startOfDay(for: to) // <2>
        let numberOfDays = dateComponents([.day], from: fromDate, to: toDate) // <3>
        
        return numberOfDays.day!
    }
}
