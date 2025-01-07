//
//  StackTests.swift
//  DataStructuresAndAlgorithms
//
//  Created by Илья Шаповалов on 07.01.2025.
//

import Testing
import DataStructuresAndAlgorithms

struct StackTests {
    static func makeSUT(_ count: Int = 3) -> Stack<Int> {
        var storage = [Int]()
        for i in 0..<count {
            storage.append(i)
        }
        return Stack(storage)
    }
    
    @Test func isEmpty() async throws {
        var sut = Self.makeSUT(1)
        
        #expect(sut.isEmpty == false)
        
        sut.pop()
        
        #expect(sut.isEmpty == true)
    }
    
    @Test func count() async throws {
        let sut = Self.makeSUT(3)
        
        #expect(sut.count == 3)
    }

    @Test func peek() async throws {
        let sut = Self.makeSUT()
        
        #expect(sut.peek() == 2)
    }
    
    @Test func push() async throws {
        var sut = Self.makeSUT()
        
        sut.push(1)
        
        #expect(sut.peek() == 1)
    }

    @Test func pop() async throws {
        var sut = Self.makeSUT()
        
        let last = sut.pop()
        
        #expect(last == 2)
    }
    
    @Test func description() async throws {
        let sut = Self.makeSUT()
        let expected = """
        ---Stack---
        2
        1
        0
        -----------
        """
        
        #expect(sut.description == expected)
    }
    
    @Test func makeIterator() async throws {
        let sut = Self.makeSUT()
        var counter = 0
        
        for _ in sut {
            counter += 1
        }
        
        #expect(sut.count == counter)
    }
}
