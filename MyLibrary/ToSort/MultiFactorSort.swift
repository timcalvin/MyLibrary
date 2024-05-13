//
//  MultiFactorSort.swift
//  MyLibrary
//
//  Created by Timothy Bryant on 1/12/23.
//

import Foundation

/// Allows a collection to be sorted by more than a single factor..
///
/// ```
/// Collection.sort(by:
///     ($0.firstFactor > $1.firstFactor),
///     ($0.secondFactor > $1.secondFactor),
///     ...
/// )
/// ```
///
/// - returns:`Bool`
/// source: https://stackoverflow.com/questions/37603960/swift-sort-array-of-objects-with-multiple-criteria

extension MutableCollection where Self : RandomAccessCollection {
  mutating func sort(
    by firstPredicate: (Element, Element) -> Bool,
    _ secondPredicate: (Element, Element) -> Bool,
    _ otherPredicates: ((Element, Element) -> Bool)...
  ) {
    sort(by:) { lhs, rhs in
      if firstPredicate(lhs, rhs) { return true }
      if firstPredicate(rhs, lhs) { return false }
      if secondPredicate(lhs, rhs) { return true }
      if secondPredicate(rhs, lhs) { return false }
      for predicate in otherPredicates {
        if predicate(lhs, rhs) { return true }
        if predicate(rhs, lhs) { return false }
      }
      return false
    }
  }
}

extension Sequence {
  func sorted(
    by firstPredicate: (Element, Element) -> Bool,
    _ secondPredicate: (Element, Element) -> Bool,
    _ otherPredicates: ((Element, Element) -> Bool)...
  ) -> [Element] {
    return sorted(by:) { lhs, rhs in
      if firstPredicate(lhs, rhs) { return true }
      if firstPredicate(rhs, lhs) { return false }
      if secondPredicate(lhs, rhs) { return true }
      if secondPredicate(rhs, lhs) { return false }
      for predicate in otherPredicates {
        if predicate(lhs, rhs) { return true }
        if predicate(rhs, lhs) { return false }
      }
      return false
    }
  }
}

