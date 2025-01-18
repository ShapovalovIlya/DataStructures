//
//  InsertionSort.swift
//  DataStructuresAndAlgorithms
//
//  Created by Илья Шаповалов on 18.01.2025.
//

import Foundation

/// `InsertionSort` - algorithm as object.
///
/// The insertion sort algorithm works as follows:
/// - Put the numbers on a pile. This pile is unsorted.
/// - Pick a number from the pile. It doesn't really matter which one you pick, but it's easiest to pick from the top of the pile.
/// - Insert this number into a new array.
/// - Pick the next number from the unsorted pile and also insert that into the new array.
///   It either goes before or after the first number you picked, so that now these two numbers are sorted.
/// - Again, pick the next number from the pile and insert it into the array in the proper sorted position.
/// - Keep doing this until there are no more numbers on the pile. You end up with an empty pile and an array that is sorted.
///
/// That's why this is called an "insertion" sort, because you take a number from the pile and insert it in the array in its proper sorted position.
public enum InsertionSort {
    @inlinable
    @_optimize(speed)
    public static func apply<Element: Equatable>(
        _ unsorted: [Element],
        comparator: (Element, Element) -> Element
    ) -> [Element] {
        unsorted.reduce(into: [Element]()) { sorted, element in
            switch sorted
                .firstIndex(where: { comparator($0, element) == $0 })
                .map(sorted.index(before:))
                .map({ max($0, sorted.startIndex) }) {
            case .some(let beforeBigger):
                sorted.insert(element, at: beforeBigger)
                
            case .none:
                sorted.append(element)
            }
        }
    }
    
    /// Sort `Array` of `Comparable` elements in ascending order.
    /// - Parameter unsorted: unsorted array of elements
    /// - Returns: sorted array of elements
    @inlinable
    @_optimize(speed)
    public static func ascending<Element: Comparable>(_ unsorted: [Element]) -> [Element] {
        apply(unsorted, comparator: max)
    }
    
    /// Sort `Array` of `Comparable` elements in descending order.
    /// - Parameter unsorted: unsorted array of elements
    /// - Returns: sorted array of elements
    @inlinable
    @_optimize(speed)
    public static func descending<Element: Comparable>(_ unsorted: [Element]) -> [Element] {
        apply(unsorted, comparator: min)
    }
    
    @inlinable
    @_optimize(speed)
    public static func sort<Element>(
        _ unsorted: [Element],
        isOrderedBefore: (Element, Element) -> Bool
    ) -> [Element] {
        var sorted = unsorted
        for index in sorted.indices {
            var current = index
            let temp = sorted[current]
            while current > 0 && isOrderedBefore(temp, sorted[current - 1]) {
                sorted[current] = sorted[current - 1]
                current -= 1
            }
            sorted[current] = temp
        }
        return sorted
    }
}
