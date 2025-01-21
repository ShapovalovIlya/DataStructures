//
//  BinaryTree.swift
//  DataStructuresAndAlgorithms
//
//  Created by Илья Шаповалов on 19.01.2025.
//

import Foundation

/// Binary tree data structure
///
/// There are three ways to traverse a binary tree:
/// - In-order (or depth-first): first look at the left child of a node, then at the node itself, and finally at its right child.
/// - Pre-order: first look at a node, then at its left and right children.
/// - Post-order: first look at the left and right children and process the node itself last.
///
public indirect enum BinaryTree<T> {
    case node(
        left: BinaryTree<T>,
        value: T,
        right: BinaryTree<T>
    )
    case empty
    
    @inlinable
    public var count: Int {
        switch self {
        case let .node(left, _, right): left.count + 1 + right.count
        case .empty: 0
        }
    }
    
    /// Traverse binary tree pre-order.
    @inlinable
    public func traversePreOrder(_ process: (T) -> Void) {
        guard case let .node(leftNode, value, rightNode) = self else {
            return
        }
        process(value)
        leftNode.traversePreOrder(process)
        rightNode.traversePreOrder(process)
    }
    
    /// Traverse binary tree in-order.
    @inlinable
    public func traverseInOrder(_ process: (T) -> Void) {
        guard case let .node(leftNode, value, rightNode) = self else {
            return
        }
        leftNode.traversePreOrder(process)
        process(value)
        rightNode.traversePreOrder(process)
    }
    
    /// Traverse binary tree post-order.
    @inlinable
    public func traversePostOrder(_ process: (T) -> Void) {
        guard case let .node(leftNode, value, rightNode) = self else {
            return
        }
        leftNode.traversePreOrder(process)
        rightNode.traversePreOrder(process)
        process(value)
    }
}

extension BinaryTree: CustomStringConvertible {
    public var description: String {
        switch self {
        case let .node(left, value, right):
            """
            value: \(value),
                left: [\(left.description)],
                right: [\(right.description)]
            """
        case .empty:
            ""
        }
    }
}
