import XCTest
@testable import MobileLearning

final class Ex06PropertyWrapperTests: XCTestCase {
    func test_6_1_clampedDouble() {
        var s = BidSettings()
        XCTAssertEqual(s.floorUSD, 0)
        s.floorUSD = 12.5
        XCTAssertEqual(s.floorUSD, 12.5)
        s.floorUSD = -3
        XCTAssertEqual(s.floorUSD, 0)
        s.floorUSD = 999
        XCTAssertEqual(s.floorUSD, 50)
    }

    func test_6_1_clampedDouble_clampsInitialValue() {
        struct Holder { @ClampedDouble(0...10) var v: Double = 100 }
        XCTAssertEqual(Holder().v, 10)
    }

    func test_6_2_countingNetwork() {
        struct Inner: AdNetwork {
            let name = "AdMob"
            let priority = 7
            func load(unitId: String) -> AdLoadResult { .loaded(network: name, ecpm: 2) }
        }
        let counting = CountingNetwork(Inner())
        XCTAssertEqual(counting.name, "AdMob")
        XCTAssertEqual(counting.priority, 7)
        XCTAssertEqual(counting.loadCount, 0)
        XCTAssertEqual(counting.load(unitId: "a"), .loaded(network: "AdMob", ecpm: 2))
        _ = counting.load(unitId: "b")
        XCTAssertEqual(counting.loadCount, 2)
    }
}
