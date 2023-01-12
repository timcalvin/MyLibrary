//
//  Calendar-HelperMethods.swift
//  MyLibrary
//
//  Created by Timothy Bryant on 1/12/23.
//

import Foundation

extension Calendar {
    
    /// Used to calculate the number of days between two dates.
    ///
    /// ```
    /// let days = numberOfDaysBetween(date1, and: date2)
    /// ```
    ///
    /// - parameters:
    ///   - from: The first date in the spread
    ///   - to: The second date in the spread
    ///
    /// source: https://sarunw.com/posts/getting-number-of-days-between-two-dates/
    
    func numberOfDaysBetween(_ from: Date, and to: Date) -> Int {
        let fromDate = startOfDay(for: from) // <1>
        let toDate = startOfDay(for: to) // <2>
        let numberOfDays = dateComponents([.day], from: fromDate, to: toDate) // <3>
        
        return numberOfDays.day!
    }
    
}
