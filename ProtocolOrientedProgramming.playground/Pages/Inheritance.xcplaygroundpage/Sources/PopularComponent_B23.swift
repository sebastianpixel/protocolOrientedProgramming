import UIKit

public protocol PopularComponent_B23 {
    var headline: String? { get set }                // UILabel
    var subtitle: String? { get set }                // UILabel
    var imageURL: URL? { get set }                   // UIImageView
    var placeholderImage: UIImage? { get set }       // UIImageView
    var numberOfLinesForHeadline: Int { get set }
    var numberOfLinesForSubtitle: Int { get set }
}
