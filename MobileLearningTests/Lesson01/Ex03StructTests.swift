import XCTest
@testable import MobileLearning

final class Ex03StructTests: XCTestCase {
    func test_3_1_forTesting_returnsModifiedCopy() {
        let original = AdConfig(unitId: "banner_home")
        let test = original.forTesting()
        XCTAssertTrue(test.testMode)
        XCTAssertEqual(test.timeoutMs, 10_000)
        XCTAssertEqual(test.unitId, "banner_home")
        XCTAssertFalse(original.testMode, "the original must not change")
    }

    func test_3_2_mergeUnique() {
        let a = AdConfig(unitId: "a")
        let b = AdConfig(unitId: "b", timeoutMs: 5_000)
        let result = mergeUnique([a, AdConfig(unitId: "a"), b, AdConfig(unitId: "b", timeoutMs: 5_000), AdConfig(unitId: "b")])
        XCTAssertEqual(result, [a, b, AdConfig(unitId: "b")])
    }

    func test_3_3_describe() {
        XCTAssertEqual(describe(AdConfig(unitId: "inter_1", timeoutMs: 4_500)), "unit=inter_1, timeout=4500ms")
    }
}
