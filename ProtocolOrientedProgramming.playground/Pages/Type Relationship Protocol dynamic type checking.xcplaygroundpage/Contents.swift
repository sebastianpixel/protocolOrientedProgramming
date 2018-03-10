//: [Previous](@previous)
//: ## Type Relationships
//: ### With Protocol and dynamic type checking
import Foundation

protocol Ordered {
    func precedes(other: Ordered) -> Bool
}

extension Ordered where Self: Comparable {
    func precedes(other: Ordered) -> Bool {
        if let other = other as? Self {                 // Downcasting / type checking at runtime
            return self < other
        } else {
            return false
        }
    }
}

extension Double: Ordered {}
extension Int: Ordered {}
3.14.precedes(other: 31.4)

2.2.precedes(other: 2)
//: [Next](@next)
