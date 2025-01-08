//
//  LinkedList.swift
//  DataStructuresAndAlgorithms
//
//  Created by Илья Шаповалов on 06.01.2025.
//

import Foundation

public struct LinkedList<T> {
    fileprivate var head: Node<T>?
    private var tail: Node<T>?
    
    //MARK: - init(_:)
    public init() {}
    
    public init(
        head: Node<T>,
        tail: Node<T>? = nil
    ) {
        self.head = head
        self.tail = tail
    }
    
    public init(sequence: some Sequence<T>) {
        sequence.forEach { append($0) }
    }
    
    public init(elements: T...) {
        self.init(elements)
    }
    
    public init(_ array: [T]) {
        self.init(sequence: array)
    }
    
    //MARK: - Public properties
    public var isEmpty: Bool { head == nil }
    public var first: Node<T>? { head }
    public var last: Node<T>? { tail }
    
    public var count: Int {
        var node = head
        var i = 0
        while let current = node {
            i += 1
            node = current.next
        }
        return i
    }
    
    public mutating func append(_ value: T) {
        let newNode = Node(value)
        if let tail {
            newNode.previous = tail
            tail.next = newNode
        }
        else {
            head = newNode
        }
        tail = newNode
    }
    
    public func nodeAt(index: Int) -> Node<T>? {
        if index < .zero { return nil }
        var node = head
        var i = index
        while let current = node {
            if i == .zero { return current }
            i -= 1
            node = current.next
        }
        return nil
    }
    
    @discardableResult
    public mutating func remove(node: Node<T>) -> T? {
        let prev = node.previous
        let next = node.next
        
        if let prev {
            prev.next = next
        }
        else {
            head = next
        }
        next?.previous = prev
        
        if next == nil {
            tail = prev
        }
        
        node.next = nil
        node.previous = nil
        return node.value
    }
    
    public mutating func removeAll() {
        head = nil
        tail = nil
    }
    
    public subscript(_ index: Int) -> T? {
        nodeAt(index: index)?.value
    }
}

//MARK: - CustomStringConvertible
extension LinkedList: CustomStringConvertible {
    public var description: String {
        var text = "["
        var node = head
        
        while let current = node {
            text.append(current.description)
            node = current.next
            if node != nil { text.append(", ") }
        }
        return text.appending("]")
    }
}

extension LinkedList: Sequence {
    public struct Iterator: IteratorProtocol {
        public typealias Element = Node<T>
        
        var node: Element?
        
        public mutating func next() -> Element? {
            guard let current = node else {
                return nil
            }
            self.node = current.next
            return current
        }
        
    }
    
    public func makeIterator() -> Iterator {
        Iterator(node: head)
    }
}
