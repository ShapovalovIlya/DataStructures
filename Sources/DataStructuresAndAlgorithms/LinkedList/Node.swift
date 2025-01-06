//
//  Node.swift
//  DataStructuresAndAlgorithms
//
//  Created by Илья Шаповалов on 06.01.2025.
//

import Foundation

public class Node<T> {
    public var value: T
    public var next: Node<T>?
    public weak var previous: Node<T>?
    
    public init(_ value: T) { self.value = value }
}

extension Node: CustomStringConvertible {
    public var description: String { String(reflecting: value) }
}
