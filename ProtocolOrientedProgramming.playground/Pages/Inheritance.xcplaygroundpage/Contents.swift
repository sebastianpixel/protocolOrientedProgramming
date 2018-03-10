//: [Previous](@previous)
//: ## Type Relationships
//: ### Issues with Inheritance
//: * subclassing: what to override and what not?
//: * inherited stored properties of superclass
//: * inherited initializers
//: * no retroactive modeling / can't change the superclas
//: * only classes (most Swift types are value types)
import UIKit

class PopularComponent: UIView, PopularComponent_B23 {

    let headlineLabel = UILabel()
    let subtitleLabel = UILabel()
    let imageView = UIImageView()

    var headline: String?
    var subtitle: String?

    var numberOfLinesForHeadline: Int = 0
    var numberOfLinesForSubtitle: Int = 0

    var imageURL: URL?
    var placeholderImage: UIImage?

    init() {
        // do stuff
    }
}
//: [Next](@next)
