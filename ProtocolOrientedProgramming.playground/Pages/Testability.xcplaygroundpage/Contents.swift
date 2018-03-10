//: [Previous](@previous)
//: ## Testability
//: ### Wrapping `URLSession` in a protocol
import UIKit
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true

protocol APIClientProtocol {
    func get(_ url: String, callback: ((Data?, Error?) -> Void)?)
}

final class APIClient: APIClientProtocol {
    func get(_ url: String, callback: ((Data?, Error?) -> Void)?) {
        guard let url = URL(string: url) else { return }

        print("\nRequested \(url.absoluteString)")
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            DispatchQueue.main.async {

                data.map { print("Received \($0.description)") }

                callback?(data, error)
            }
        }.resume()
    }
}

let imageURL = "http://thecatapi.com/api/images/get?format=src&type=jpg"

APIClient().get(imageURL) { data, _ in
    
    PlaygroundPage.current.liveView = data
        .map(UIImage.init(data:))
        .map(UIImageView.init(image:))
}
//: ### Exchanging `URLSession` with MockClass for testing
import XCTest

class APIClientTests: XCTestCase {

    static var absoluteURL: String?

    func testURL() {
        class APIClientMock: APIClientProtocol {
            func get(_ url: String, callback: ((Data?, Error?) -> Void)?) {
                APIClientTests.absoluteURL = url
            }
        }
        let client = APIClientMock()

        let testURL = "https://www.xing.com/"
        client.get(testURL, callback: nil)

        XCTAssertEqual(APIClientTests.absoluteURL, testURL)
    }
}

APIClientTests.defaultTestSuite.run()
//: [Next](@next)
