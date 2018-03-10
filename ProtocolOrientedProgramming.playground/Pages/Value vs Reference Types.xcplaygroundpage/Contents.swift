//: [Previous](@previous)
//: ## Swift Value Types vs Reference Types
//: ### Structs and Enums also have
//: * Encapsulation
//: * Access Controll
//: * Abstraction
//: * Namespace
//: * Extensibility
//: ### Key difference: pass by value vs pass by reference
import Foundation

class MyClass {
    var value = 0
}

struct MyStruct {
    var value = 0
}

let classA = MyClass()
classA.value = 1

let classB = classA
classA.value
classB.value = 10
classB.value
classA.value
//: [Next](@next)
