//
//  LinkedListTests.swift
//  DataStructuresAndAlgorithms
//
//  Created by Илья Шаповалов on 06.01.2025.
//

import Testing
import DataStructuresAndAlgorithms

struct LinkedListTests {
    typealias Sut = LinkedList<Int>
    
    static func makeSut(_ nodes: Int = 3) -> Sut {
        var sut = LinkedList<Int>()
        for i in 0..<nodes {
            sut.append(i)
        }
        return sut
    }
    
    @Test func append() async throws {
        let sut = Self.makeSut()
        
        #expect(sut.first?.value == 0)
        #expect(sut.first?.next?.value == 1)
        #expect(sut.last?.value == 2)
        #expect(sut.last?.previous?.value == 1)
    }
    
    @Test func description() async throws {
        let sut = Self.makeSut()
        
        #expect(sut.description == "[0, 1, 2]")
    }
    
    @Test func count() async throws {
        let sut = Self.makeSut(5)
        
        #expect(sut.count == 5)
    }
    
    @Test func initWithSequence() async throws {
        let sut = Sut(elements: 1, 2, 3)
        
        #expect(sut.count == 3)
    }
    
    @Test(arguments: [0,1,2])
    func nodeAt(index: Int) async throws {
        let sut = Self.makeSut()
        
        let node = sut.nodeAt(index: index)
        
        #expect(node?.value == index)
    }
    
    @Test func removeAll() async throws {
        var sut = Self.makeSut()
        
        sut.removeAll()
        
        #expect(sut.first == nil)
        #expect(sut.last == nil)
        #expect(sut.count == 0)
    }
    
    @Test func removeNode() async throws {
        var sut = Self.makeSut()
        let nodeToRemove = try #require(sut.nodeAt(index: 1))
        
        let removed = sut.remove(node: nodeToRemove)
        
        #expect(removed == 1)
        #expect(nodeToRemove.next == nil)
        #expect(nodeToRemove.previous == nil)
        #expect(sut.description == "[0, 2]")
    }
    
    @Test func makeIterator() async throws {
        let sut = Self.makeSut()
        var counter = 0
        
        for _ in sut {
            counter += 1
        }
        
        #expect(sut.count == counter)
    }
    
    @Test func subscriptingValue() async throws {
        let sut = Self.makeSut()
        
        let val = sut[1]
        
        #expect(val == sut.nodeAt(index: 1)?.value)
    }
}
