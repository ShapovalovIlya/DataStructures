//
//  Heap.swift
//  DataStructuresAndAlgorithms
//
//  Created by Илья Шаповалов on 20.04.2025.
//

import Foundation

public struct Heap<Element> {
    
    public private(set) var elements: [Element]
    
    /// Returns true if the `lhs` has a higher priority than the `rhs`.
    public let isHigherPriority: (Element, Element) -> Bool
    
    //MARK: - init(_:)
    public init(
        elements: [Element] = .init(),
        isHigherPriority: @escaping (Element, Element) -> Bool
    ) {
        self.elements = elements.sorted(by: isHigherPriority)
        self.isHigherPriority = isHigherPriority
    }
    
    //MARK: - internal methods
    mutating func swapElement(at lhs: Int, with rhs: Int) {
        elements.swapAt(lhs, rhs)
    }
    
    mutating func siftUp(elementAt index: Int) {
        let parent = parentIndex(of: index)
        guard !isRoot(index), isHigherPriority(index, than: parent) else {
            return
        }
        swapElement(at: index, with: parent)
        siftUp(elementAt: parent)
    }
    
    mutating func siftDown(elementAt index: Int) {
        let child = highestPriorityIndex(for: index)
        if index == child {
            return
        }
        swapElement(at: index, with: child)
        siftDown(elementAt: child)
    }
}
 
public extension Heap {
    @inlinable
    init(
        _ s: some Sequence<Element>,
        isHigherPriority: @escaping (Element, Element) -> Bool
    ) {
        self.init(
            elements: Array(s),
            isHigherPriority: isHigherPriority
        )
    }
    
    //MARK: - Helpers
    @inlinable
    var isEmpty: Bool { elements.isEmpty }
    
    @inlinable
    var count: Int { elements.count }
    
    @inlinable
    func peek() -> Element? { elements.first }
    
    @inlinable
    func isRoot(_ index: Int) -> Bool { index == .zero }
    
    @inlinable
    func leftChildIndex(of index: Int) -> Int {
        (2 * index) + 1
    }
    
    @inlinable
    func rightChildIndex(of index: Int) -> Int {
        (2 * index) + 2
    }
    
    @inlinable
    func parentIndex(of index: Int) -> Int {
        (index - 1) / 2
    }
    
    @inlinable
    func isHigherPriority(_ lhs: Int, than rhs: Int) -> Bool {
        isHigherPriority(elements[lhs], elements[rhs])
    }
    
    @inlinable
    func highestPriorityIndex(of parent: Int, and child: Int) -> Int {
        guard child < count, isHigherPriority(child, than: parent) else {
            return parent
        }
        return child
    }
    
    @inlinable
    func highestPriorityIndex(for parent: Int) -> Int {
        highestPriorityIndex(
            of: highestPriorityIndex(of: parent, and: leftChildIndex(of: parent)),
            and: rightChildIndex(of: parent)
        )
    }
    
    //MARK: - Heap methods
    mutating func enqueue(_ element: Element) {
        elements.append(element)
        siftUp(elementAt: count - 1)
    }
    
    mutating func dequeue() -> Element? {
        if isEmpty {
            return nil
        }
        swapElement(at: 0, with: count - 1)
        let element = elements.removeLast()
        if !isEmpty {
            siftDown(elementAt: 0)
        }
        return element
    }
}

//MARK: - Sequence
extension Heap: Sequence {
    @inlinable
    public func makeIterator() -> IndexingIterator<[Element]> {
        elements.makeIterator()
    }
}

//MARK: - Collection
extension Heap: Collection {
    
    @inlinable
    public var startIndex: Int { elements.startIndex }
    
    @inlinable
    public var endIndex: Int { elements.endIndex }
    
    @inlinable
    public subscript(position: Int) -> Element {
        elements[position]
    }

    @inlinable
    public func index(after i: Int) -> Int {
        elements.index(after: i)
    }
}

//MARK: - Equatable
public extension Heap where Element: Equatable {
    @inlinable
    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.elements == rhs.elements
    }
    
    @inlinable
    static func == (lhs: Heap<Element>, rhs: Array<Element>) -> Bool {
        lhs.elements == rhs
    }
    
    @inlinable
    static func == (lhs: Array<Element>, rhs: Heap<Element>) -> Bool {
        lhs == rhs.elements
    }
}

//MARK: - Comparable
public extension Heap where Element: Comparable {
    @inlinable
    static func maxHeap<S: Sequence>(_ elements: S) -> Heap where S.Element == Element {
        Heap(elements, isHigherPriority: >)
    }
    
    @inlinable
    static func minHeap<S: Sequence>(_ elements: S) -> Heap where S.Element == Element {
        Heap(elements, isHigherPriority: <)
    }
}
