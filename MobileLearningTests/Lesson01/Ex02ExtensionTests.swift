import XCTest
@testable import MobileLearning

final class Ex02ExtensionTests: XCTestCase {
    func test_2_1_compactString() {
        XCTAssertEqual(999.compactString, "999")
        XCTAssertEqual(1000.compactString, "1K")
        XCTAssertEqual(1500.compactString, "1.5K")
        XCTAssertEqual(12_300.compactString, "12.3K")
        XCTAssertEqual(2_000_000.compactString, "2M")
        XCTAssertEqual(3_400_000.compactString, "3.4M")
    }

    func test_2_2_isValidAdUnitId() {
        XCTAssertTrue("ca-app-pub-3940256099942544/6300978111".isValidAdUnitId)
        XCTAssertFalse("ca-app-pub-3940256099942544".isValidAdUnitId)
        XCTAssertFalse("ca-app-pub-39402560999425/6300978111".isValidAdUnitId)
        XCTAssertFalse("xx-ca-app-pub-3940256099942544/6300978111".isValidAdUnitId)
    }

    func test_2_3_orDash() {
        let missing: String? = nil
        let blank: String? = "  "
        let value: String? = "AdMob"
        XCTAssertEqual(missing.orDash, "-")
        XCTAssertEqual(blank.orDash, "-")
        XCTAssertEqual(value.orDash, "AdMob")
    }
}
