//
//  Trie.swift
//  DataStructuresAndAlgorithms
//
//  Created by Илья Шаповалов on 21.01.2025.
//

import Foundation

public struct Trie<Element: Hashable> {
    typealias Node = TrieNode<Element>
    
    private var root: Node?
    
    public init() {
        self.root = nil
    }
}

public extension Trie where Element == String {
    mutating func insertWord(_ word: String) {
        var currentNode = root
        
        word.lazy
            .map { $0.lowercased() }
            .forEach { char in
                if root == nil {
                    root = Node(char)
                    currentNode = root
                    return
                }
                if let child = currentNode?.children[char] {
                    currentNode = child
                    return
                }
                currentNode?.addChild(char)
                currentNode = currentNode?.children[char]
            }
        
        currentNode?.isTerminate = true
    }
    
    func containsWord(_ word: String) -> Bool {
        if word.isEmpty { return false }
        var currentNode = root
        let characters = word.map { $0.lowercased() }
        
        if currentNode?.element != characters.first { return false }
        var currentIndex = 1
        
        while currentIndex < characters.endIndex,
              let child = currentNode?.children[characters[currentIndex]] {
            currentIndex += 1
            currentNode = child
        }
        
        return currentIndex == characters.endIndex
        && currentNode?.isTerminate == true
    }
}
