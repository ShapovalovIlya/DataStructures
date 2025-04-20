//
//  HeapTest.swift
//  DataStructuresAndAlgorithms
//
//  Created by Илья Шаповалов on 20.04.2025.
//

import Testing
import DataStructuresAndAlgorithms

struct HeapTest {

    @Test func count() async throws {
        let elements = [1, 2, 3]
        let sut = Heap(elements: elements, isHigherPriority: <)
        
        #expect(sut.isEmpty == elements.isEmpty)
        #expect(sut.count == elements.count)
        #expect(sut.peek() == elements.first)
    }

    @Test func enqueueElement() async throws {
        var sut = Heap(elements: [1], isHigherPriority: <)
        
        sut.enqueue(4)
        sut.enqueue(3)
        sut.enqueue(2)
        
        #expect(sut == [1, 2, 3, 4])
    }
    
    @Test func initialisers() async throws {
        let elements = (1...100).shuffled()
        let max = Heap.maxHeap(elements)
        
        #expect(max.elements.first == 100)
        #expect(max.elements.last == 1)
        
        let min = Heap.minHeap(elements)
        
        #expect(min.elements.first == 1)
        #expect(min.elements.last == 100)
    }
}
