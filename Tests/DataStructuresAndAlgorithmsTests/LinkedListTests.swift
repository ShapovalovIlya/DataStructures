//
//  LinkedListTests.swift
//  DataStructuresAndAlgorithms
//
//  Created by Илья Шаповалов on 06.01.2025.
//

import Testing
import DataStructuresAndAlgorithms

struct LinkedListTests {
    static func makeSut(_ nodes: Int = 3) -> LinkedList<Int> {
        let sut = LinkedList<Int>()
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
    
    @Test(arguments: [0,1,2])
    func nodeAt(index: Int) async throws {
        let sut = Self.makeSut()
        
        let node = sut.nodeAt(index: index)
        
        #expect(node?.value == index)
    }
    
    @Test func removeAll() async throws {
        let sut = Self.makeSut()
        
        sut.removeAll()
        
        #expect(sut.first == nil)
        #expect(sut.last == nil)
        #expect(sut.count == 0)
    }
    
}
