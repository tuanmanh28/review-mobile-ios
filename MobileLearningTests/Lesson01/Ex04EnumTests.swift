import XCTest
@testable import MobileLearning

final class Ex04EnumTests: XCTestCase {
    private let events: [AdEvent] = [
        .impression(network: "AdMob", revenueMicros: 1_500_000),
        .click(network: "AdMob"),
        .impression(network: "Meta", revenueMicros: 250_000),
        .loadFailed(network: "Meta", code: 3),
        .closed,
    ]

    func test_4_1_logName() {
        XCTAssertEqual(events.map(\.logName),
                       ["ad_impression", "ad_click", "ad_impression", "ad_load_failed", "ad_closed"])
    }

    func test_4_2_totalRevenueUSD() {
        XCTAssertEqual(totalRevenueUSD(events), 1.75, accuracy: 1e-9)
        XCTAssertEqual(totalRevenueUSD([]), 0, accuracy: 1e-9)
    }

    func test_4_3_shouldRetry() {
        XCTAssertTrue(shouldRetry(.loadFailed(network: "AdMob", code: 0)))
        XCTAssertTrue(shouldRetry(.loadFailed(network: "AdMob", code: 2)))
        XCTAssertFalse(shouldRetry(.loadFailed(network: "AdMob", code: 3)))
        XCTAssertFalse(shouldRetry(.click(network: "AdMob")))
    }
}
