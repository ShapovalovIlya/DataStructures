//
//  File.swift
//  DataStructuresAndAlgorithms
//
//  Created by Илья Шаповалов on 12.01.2025.
//

import Foundation

final class Ref<T> {
    var val : T
    init(_ v : T) { val = v }
}

struct Box<T> {
    var ref : Ref<T>
    init(_ x : T) { ref = Ref(x) }
    
    var value: T {
        get { ref.val }
        set {
            if isKnownUniquelyReferenced(&ref) {
                ref.val = newValue
                return
            }
            ref = Ref(newValue)
        }
    }
}
