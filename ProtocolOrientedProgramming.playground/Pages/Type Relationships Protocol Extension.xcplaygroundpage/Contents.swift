//: [Previous](@previous)
//: ## Type Relationships
//: ### With Protocol + Extension
import Foundation

protocol Ordered {
    func precedes(other: Self) -> Bool
}

extension Ordered where Self: Comparable {
    func precedes(other: Self) -> Bool {
        return self < other                             // default implementation
    }
}

extension Double: Ordered {}

3.14.precedes(other: 31.4)
//: [Next](@next)
