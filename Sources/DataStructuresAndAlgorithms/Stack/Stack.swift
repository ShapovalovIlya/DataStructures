//
//  Stack.swift
//  DataStructuresAndAlgorithms
//
//  Created by Илья Шаповалов on 07.01.2025.
//

import Foundation

public struct Stack<T> {
    fileprivate var storage: [T]
    
    //MARK: - init(_:)
    public init(_ array: [T] = []) { self.storage = array }
    
    public init(_ elements: some Sequence<T>) {
        self.init(Array(elements))
    }
    
    //MARK: - Public properties
    public var isEmpty: Bool { storage.isEmpty }
    public var count: Int { storage.count }
    
    //MARK: - Public methods
    public func peek() -> T? {
        storage.last
    }
    
    public mutating func push(_ element: T) {
        storage.append(element)
    }
    
    @discardableResult
    public mutating func pop() -> T? {
        storage.popLast()
    }
}

//MARK: - Sequence
extension Stack: Sequence {
    public func makeIterator() -> Iterator {
        Iterator(base: storage.makeIterator())
    }
    
    public struct Iterator: IteratorProtocol {
        public typealias Element = T
        var base: [T].Iterator
        
        public mutating func next() -> T? {
            base.next()
        }
        
    }
}

//MARK: - CustomStringConvertible
extension Stack: CustomStringConvertible {
    
    public var description: String {
        "---Stack---\n"
            .appending(
                storage
                    .map(String.init(describing:))
                    .reversed()
                    .joined(separator: "\n")
            )
            .appending("\n-----------")
    }
}
