//
//  BinaryTreeTests.swift
//  DataStructuresAndAlgorithms
//
//  Created by Илья Шаповалов on 19.01.2025.
//

import Testing
import DataStructuresAndAlgorithms

struct BinaryTreeTests {
    typealias Sut = BinaryTree<String>

    @Test func count() async throws {
        let sut = Self.makeSut()
        
        #expect(sut.count == 12)
    }

    @Test func description() async throws {
        let sut = Self.makeSut()
        
        print(sut.description)
    }
    
    
}

private extension BinaryTreeTests {
    static func makeSut() -> Sut {
        Sut.node(
            left: .node(
                left: .node(left: .empty, value: "5", right: .empty),
                value: "*",
                right: .node(
                    left: .node(left: .empty, value: "a", right: .empty),
                    value: "-",
                    right: .node(left: .empty, value: "10", right: .empty)
                )
            ),
            value: "+",
            right: .node(
                left: .node(
                    left: .node(left: .empty, value: "4", right: .empty),
                    value: "-",
                    right: .empty
                ),
                value: "*",
                right: .node(
                    left: .node(left: .empty, value: "3", right: .empty),
                    value: "/",
                    right: .node(left: .empty, value: "b", right: .empty)
                )
            )
        )
    }
}
