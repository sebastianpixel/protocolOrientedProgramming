//: [Previous](@previous)
//: ## Type Relationships
//: ### Via Inheritance
import Foundation

class Ordered {
    func precedes(other: Ordered) -> Bool {
        fatalError("Implement me!")                     // delegating responsibility to subclasses
    }
}

class Number: Ordered {
    var value: Int?
    override func precedes(other: Ordered) -> Bool {
        if let value = value,
            let otherValue = (other as? Number)?.value {
            return value < otherValue
        } else {
            return false
        }
    }
}

let num1 = Number()
num1.value = 1

let num2 = Number()
num2.value = 2

num1.precedes(other: num2)
//: [Next](@next)
