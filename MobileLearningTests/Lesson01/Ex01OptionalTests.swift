import XCTest
@testable import MobileLearning

final class Ex01OptionalTests: XCTestCase {
    func test_1_1_displayName() {
        XCTAssertEqual(displayName(AdUser(name: "Tuan", country: nil)), "Tuan")
        XCTAssertEqual(displayName(AdUser(name: nil, country: "VN")), "Guest")
        XCTAssertEqual(displayName(AdUser(name: "   ", country: "VN")), "Guest")
        XCTAssertEqual(displayName(nil), "Guest")
    }

    func test_1_2_parseBid() {
        XCTAssertEqual(parseBid("0.35") ?? -1, 0.35, accuracy: 1e-9)
        XCTAssertEqual(parseBid("0") ?? -1, 0, accuracy: 1e-9)
        XCTAssertNil(parseBid(nil))
        XCTAssertNil(parseBid("abc"))
        XCTAssertNil(parseBid("-1.2"))
    }

    func test_1_3_countryOrDefault() {
        XCTAssertEqual(countryOrDefault(AdUser(name: "A", country: "US")), "US")
        XCTAssertEqual(countryOrDefault(AdUser(name: "A", country: nil)), "VN")
        XCTAssertEqual(countryOrDefault(nil), "VN")
    }
}
