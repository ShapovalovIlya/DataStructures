//
//  QueueTest.swift
//  DataStructuresAndAlgorithms
//
//  Created by Илья Шаповалов on 08.01.2025.
//

import Testing
import DataStructuresAndAlgorithms

struct QueueTest {
    typealias Sut = Queue<Int>
    static func makeSut(_ count: Int = 3) -> Sut {
        Sut(sequence: 0..<count)
    }
    
    @Test func properties() async throws {
        let sut = Self.makeSut()
        
        #expect(sut.count == 3)
        #expect(sut.isEmpty == false)
        #expect(sut.description == "[0, 1, 2]")
    }
    
    @Test func enqueue() async throws {
        var sut = Self.makeSut(0)
        
        #expect(sut.isEmpty == true)
        
        sut.enqueue(1)
        
        #expect(sut.isEmpty == false)
    }

    @Test func dequeue() async throws {
        var sut = Self.makeSut()
        
        let val = sut.dequeue()
        
        #expect(val == 0)
    }

    @Test func peek() async throws {
        let sut = Self.makeSut()
        
        let first = sut.peek()
        
        #expect(first == 0)
    }
    
    @Test func queueAsSequence() async throws {
        let sut = Self.makeSut()
        var counter = 0
        
        for _ in sut {
            counter += 1
        }
        
        #expect(sut.count == counter)
    }
}
