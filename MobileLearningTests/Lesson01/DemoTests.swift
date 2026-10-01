import XCTest
@testable import MobileLearning

/// Run each demo on its own: click ◇ next to the function name. Output appears in the Debug area (⇧⌘Y → Console). Run on an iPhone simulator.
final class DemoTests: XCTestCase {
    private func show(_ index: Int) {
        let demo = Lesson01.lesson.demos[index]
        print("── \(demo.id) · \(demo.title)  (Android: \(demo.counterpart)) ──")
        demo.run().forEach { print("  \($0)") }
    }

    func test_d01_optional() { show(0) }
    func test_d02_extension() { show(1) }
    func test_d03_struct() { show(2) }
    func test_d04_enum() { show(3) }
    func test_d05_protocol() { show(4) }
    func test_d06_propertyWrapper() { show(5) }
    func test_d07_scope() { show(6) }
    func test_d08_generics() { show(7) }
}
