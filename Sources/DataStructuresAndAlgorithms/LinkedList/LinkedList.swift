//
//  LinkedList.swift
//  DataStructuresAndAlgorithms
//
//  Created by Илья Шаповалов on 06.01.2025.
//

import Foundation

public class LinkedList<T> {
    fileprivate var head: Node<T>?
    private var tail: Node<T>?
    
    public init(
        head: Node<T>? = nil,
        tail: Node<T>? = nil
    ) {
        self.head = head
        self.tail = tail
    }
    
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
    
    public func append(_ value: T) {
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
    
    public func remove(node: Node<T>) -> T? {
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
    
    public func removeAll() {
        head = nil
        tail = nil
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
