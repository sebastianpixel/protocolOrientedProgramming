//: [Previous](@previous)
//: ## Protocols as Interfaces
//: ### Example: XNGComponents
import UIKit

protocol PopularComponent_B20 {
    var headline: String? { get set }                   // UILabel
    var subtitle: String? { get set }                   // UILabel
    var imageURL: URL? { get set }                      // UIImageView
    var placeholderImage: UIImage? { get set }          // UIImageView
    var numberOfLinesForHeadline: Int { get set }
    var numberOfLinesForSubtitle: Int { get set }
}

class PopularComponent: UIView, PopularComponent_B20 {

    let headlineLabel = UILabel()
    let subtitleLabel = UILabel()
    let imageView = UIImageView()

    var headline: String? { didSet { headlineLabel.text = headline } }
    var subtitle: String? { didSet { subtitleLabel.text = subtitle } }

    var numberOfLinesForHeadline: Int {
        get { return headlineLabel.numberOfLines }
        set { headlineLabel.numberOfLines = numberOfLinesForHeadline }
    }

    var numberOfLinesForSubtitle: Int {
        get { return subtitleLabel.numberOfLines }
        set { subtitleLabel.numberOfLines = numberOfLinesForSubtitle }
    }

    var imageURL: URL? {
        didSet {
            if let imageURL = imageURL,
                let imageData = try? Data(contentsOf: imageURL) {
                imageView.image = UIImage(data: imageData)
            } else {
                imageView.image = placeholderImage
            }
        }
    }
    var placeholderImage: UIImage? {
        didSet {
            if imageView.image == nil {
                imageView.image = placeholderImage
            }
        }
    }
}

class ComponentFactory {

    func b23_popularComponent() -> PopularComponent_B20 {
        let component = PopularComponent()
        component.imageView.bounds.size = CGSize(width: 48, height: 48)
        return component
    }
}
//: [Next](@next)
