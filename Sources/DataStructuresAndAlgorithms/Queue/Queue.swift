//
//  Queue.swift
//  DataStructuresAndAlgorithms
//
//  Created by Илья Шаповалов on 08.01.2025.
//

import Foundation

public struct Queue<T> {
    fileprivate var list: LinkedList<T>
    
    //MARK: - init(_:)
    public init() { list = .init() }
    
    public init(elements: T...) {
        self.list = .init(sequence: elements)
    }
    
    public init(sequence: some Sequence<T>) {
        self.list = .init(sequence: sequence)
    }
    
    //MARK: - Public properties
    public var isEmpty: Bool { list.isEmpty }
    public var count: Int { list.count }
    
    //MARK: - Public methods
    public mutating func dequeue() -> T? {
        guard !list.isEmpty, let element = list.first else {
            return nil
        }
        return list.remove(node: element)
    }
    
    public mutating func enqueue(_ element: T) {
        list.append(element)
    }
    
    public func peek() -> T? {
        list.first?.value
    }
}

extension Queue: Sequence {
    public struct Iterator: IteratorProtocol {
        public typealias Element = T
        var base: LinkedList<T>.Iterator
        
        public mutating func next() -> T? {
            base.next()?.value
        }
    }
    
    public func makeIterator() -> Iterator {
        Iterator(base: list.makeIterator())
    }
}

extension Queue: CustomStringConvertible {
    public var description: String { list.description }
}
