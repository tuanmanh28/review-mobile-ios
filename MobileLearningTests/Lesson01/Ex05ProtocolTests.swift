import XCTest
@testable import MobileLearning

final class Ex05ProtocolTests: XCTestCase {
    func test_5_1_fakeNetwork() {
        let net = FakeNetwork(name: "AdMob", priority: 10, result: .noFill)
        XCTAssertEqual(net.name, "AdMob")
        XCTAssertEqual(net.priority, 10)
        XCTAssertEqual(net.load(unitId: "home"), .noFill)
        XCTAssertEqual(net.requestedUnits, ["home"])
    }

    func test_5_2_waterfall_picksFirstLoadedByPriority() {
        let low = FakeNetwork(name: "Unity", priority: 1, result: .loaded(network: "Unity", ecpm: 0.5))
        let high = FakeNetwork(name: "AdMob", priority: 10, result: .noFill)
        let mid = FakeNetwork(name: "Meta", priority: 5, result: .loaded(network: "Meta", ecpm: 1.1))

        let result = waterfall([low, high, mid], unitId: "inter")

        XCTAssertEqual(result, .loaded(network: "Meta", ecpm: 1.1))
        XCTAssertEqual(high.requestedUnits, ["inter"])
        XCTAssertEqual(mid.requestedUnits, ["inter"])
        XCTAssertTrue(low.requestedUnits.isEmpty, "networks after .loaded must not be called")
    }

    func test_5_2_waterfall_returnsNoFillWhenNothingLoads() {
        let a = FakeNetwork(name: "A", priority: 1, result: .failed(code: 2, message: "net"))
        XCTAssertEqual(waterfall([a], unitId: "x"), .noFill)
        XCTAssertEqual(waterfall([], unitId: "x"), .noFill)
    }
}
