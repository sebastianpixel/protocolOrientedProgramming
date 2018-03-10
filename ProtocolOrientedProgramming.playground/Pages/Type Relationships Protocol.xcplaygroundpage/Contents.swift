//: [Previous](@previous)
//: ## Type Relationships
//: ### With Protocol
import Foundation

protocol Ordered {
    func precedes(other: Ordered) -> Bool
}

struct Number: Ordered {                                // Swift value type
    var value: Int?
    func precedes(other: Ordered) -> Bool {
        if let value = value,
            let otherValue = (other as? Number)?.value {
            return value < otherValue
        } else {
            return false
        }
    }
}

var num1 = Number()                                     // `var` instead of `let` due to mutation
num1.value = 1

var num2 = Number()
num2.value = 2

num1.precedes(other: num2)
//: [Next](@next)
