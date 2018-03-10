//: [Previous](@previous)
import Foundation

typealias Kilometer = Double
typealias Liter = Double
typealias Location = String

protocol VehicleDelegate: class {
    func vehicleDidMove(vehicle: Vehicle, moved distance: Kilometer, consumed fuel: Liter)
}

class Vehicle {

    var efficiency: Double = 0 {
        didSet {
            efficiency = min(max(0, efficiency), 100)
        }
    }

    weak var delegate: VehicleDelegate?

    func move(from a: Location, to b: Location) {
        let distance = Kilometer((a + b).count * 8)
        delegate?.vehicleDidMove(vehicle: self, moved: distance, consumed: distance / efficiency)
    }
}

class Bike: Vehicle {

    override init() {
        super.init()
        efficiency = 200
    }
}

protocol Driver {
    var vehicle: Vehicle? { get set }
    func drive(to location: Location)
}

extension Driver where Self: Person {
    func drive(to location: Location) {
        vehicle?.move(from: self.location, to: location)
        self.location = location
    }
}

class Person: Driver {
    let name: String
    var location: Location

    var vehicle: Vehicle? {
        didSet {
            vehicle?.delegate = self
        }
    }

    init(name: String, location: Location) {
        self.name = name
        self.location = location
    }
}

extension Person: VehicleDelegate {
    func vehicleDidMove(vehicle: Vehicle, moved distance: Kilometer, consumed fuel: Liter) {
        print(distance, fuel)
    }
}

let me = Person(name: "Sebastian", location: "Munich")
me.vehicle = Bike()
me.drive(to: "Regensburg")
me.drive(to: "Frankfurt")
//: [Next](@next)

