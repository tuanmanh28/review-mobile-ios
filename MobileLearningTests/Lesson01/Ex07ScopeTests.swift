import XCTest
@testable import MobileLearning

final class Ex07ScopeTests: XCTestCase {
    func test_7_1_configured() {
        let original = AdRequest()
        let r = configured(original) { $0.unitId = "x"; $0.testMode = true }
        XCTAssertEqual(r.unitId, "x")
        XCTAssertTrue(r.testMode)
        XCTAssertEqual(original, AdRequest(), "value type: the original is unchanged")
    }

    func test_7_2_buildRequest() {
        let r = buildRequest(unitId: "banner", keywords: ["puzzle", "casual"])
        XCTAssertEqual(r, AdRequest(unitId: "banner", keywords: ["puzzle", "casual"], testMode: true))
    }

    func test_7_3_normalizeKeyword() {
        XCTAssertEqual(normalizeKeyword("  Casual Game "), "casual game")
        XCTAssertNil(normalizeKeyword("   "))
        XCTAssertNil(normalizeKeyword(nil))
    }
}
