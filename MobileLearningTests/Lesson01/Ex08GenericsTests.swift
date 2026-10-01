import XCTest
@testable import MobileLearning

final class Ex08GenericsTests: XCTestCase {
    func test_8_1_secondOrNil() {
        XCTAssertEqual(["a", "b", "c"].secondOrNil, "b")
        XCTAssertNil([1].secondOrNil)
        XCTAssertNil([Int]().secondOrNil)
    }

    func test_8_2_makeTestNetwork() {
        let net = makeTestNetwork()
        XCTAssertEqual(net.name, "TestNet")
        XCTAssertEqual(net.priority, 99)
        XCTAssertEqual(net.load(unitId: "x"), .noFill)
    }

    func test_8_3_highestPriority() {
        struct N: AdNetwork {
            let name: String
            let priority: Int
            func load(unitId: String) -> AdLoadResult { .noFill }
        }
        let list: [any AdNetwork] = [N(name: "a", priority: 1), N(name: "b", priority: 9), N(name: "c", priority: 5)]
        XCTAssertEqual(highestPriority(list)?.name, "b")
        XCTAssertNil(highestPriority([]))
    }

    func test_8_4_ttlCache() {
        var now = 0
        let cache = TtlCache<String, Int>(ttlMs: 1_000, clock: { now })
        cache.set(5, for: "ecpm")
        XCTAssertEqual(cache.value(for: "ecpm"), 5)
        now = 999
        XCTAssertEqual(cache.value(for: "ecpm"), 5)
        now = 1_000
        XCTAssertNil(cache.value(for: "ecpm"), "expires once ttlMs has elapsed")
        XCTAssertEqual(cache.count, 0, "expired entry must be removed")
        XCTAssertNil(cache.value(for: "missing"))
    }
}
