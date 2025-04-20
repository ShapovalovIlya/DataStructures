//
//  TreeTests.swift
//  DataStructuresAndAlgorithms
//
//  Created by Илья Шаповалов on 18.01.2025.
//

import Testing
import DataStructuresAndAlgorithms

struct TrieTests {
    
    @Test func trieNodeChildren() async throws {
        let sut = TrieNode(1)
        let value = 2
        
        #expect(sut.contains(value) == false)
        
        let insert = sut.addChild(value)
        
        #expect(insert.inserted == true)
        #expect(insert.element == value)
        
        #expect(sut.contains(value) == true)
        
        let doubleInsert = sut.addChild(value)
        
        #expect(doubleInsert.inserted == false)
        #expect(doubleInsert.element == value)
    }

    @Test func trieOfWords() async throws {
        var sut = Trie<String>()
        
        sut.insertWord("Bobcat")
        
        #expect(sut.containsWord("Bobcat") == true)
    }
}
