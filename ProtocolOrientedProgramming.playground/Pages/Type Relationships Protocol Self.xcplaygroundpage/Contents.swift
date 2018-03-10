//: [Previous](@previous)
//: ## Type Relationships
//: ### With Protocol & Self Requirement
import Foundation

protocol Ordered {
    func precedes(other: Self) -> Bool                  // `Self` is the conforming type, static type checking
}

struct Number: Ordered {
    var value: Int?
    func precedes(other: Number) -> Bool {
        if let value = value,
            let otherValue = other.value {
            return value < otherValue
        } else {
            return false
        }
    }
}


var num1 = Number()
num1.value = 1

var num2 = Number()
num2.value = 2

num1.precedes(other: num2)
//: [Next](@next)
