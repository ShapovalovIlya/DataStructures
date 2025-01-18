//
//  SortTests.swift
//  DataStructuresAndAlgorithms
//
//  Created by Илья Шаповалов on 18.01.2025.
//

import Testing
import DataStructuresAndAlgorithms

struct SortTests {
    static var randomArray: [Int] {
        Array(
            repeating: Int.random(in: 0...100),
            count: Int.random(in: 10...100)
        )
    }

    @Test func insertionSortAscending() async throws {
        let unsorted = Self.randomArray

        let sorted = InsertionSort.ascending(unsorted)
        
        #expect(sorted == unsorted.sorted(by: >))
    }

    @Test func insertionSortDescending() async throws {
        let unsorted = Self.randomArray
        
        let sorted = InsertionSort.descending(unsorted)
        
        #expect(sorted == unsorted.sorted(by: <))
    }

    @Test func insertionSort() async throws {
        let unsorted = Self.randomArray
        
        let ascending = InsertionSort.sort(unsorted, isOrderedBefore: >)
        
        #expect(ascending == unsorted.sorted(by: >))
        
        let descending = InsertionSort.sort(unsorted, isOrderedBefore: <)
        
        #expect(descending == unsorted.sorted(by: <))
    }
}
