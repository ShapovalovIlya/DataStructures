//
//  TrieNode.swift
//  DataStructuresAndAlgorithms
//
//  Created by Илья Шаповалов on 21.01.2025.
//

import Foundation

public class TrieNode<T: Hashable> {
    public var element: T
    public var children: [T: TrieNode] = .init()
    public weak var parent: TrieNode?
    public var isTerminate = false
    
    //MARK: - init(_:)
    public init(
        _ element: T,
        parent: TrieNode? = nil
    ) {
        self.element = element
        self.parent = parent
    }
    
    
}

public extension TrieNode {
    //MARK: - Public methods
    @discardableResult
    func addChild(_ newElement: T) -> (inserted: Bool, element: T) {
        if let current = children[newElement]?.element {
            return (false, current)
        }
        children[newElement] = TrieNode(newElement, parent: self)
        return (true, newElement)
    }
    
    func contains(_ element: T) -> Bool {
        children.contains { $0.key == element }
    }
}
