import XCTest
@testable import MobileLearning

/// A scratchpad for trying out statements — every type in the app is available.
///
/// 1. Write code in `test_try1`.
/// 2. Click ◇ next to the function name (or put the cursor inside the function and press ⌃⌥⌘U) → output in the Debug area (⇧⌘Y).
/// 3. To step line by line: click a line number to set a breakpoint → run the test → F6 (Step Over) each line,
///    inspect variables in the Variables view, or type `po <expression>` in the LLDB console.
final class SandboxTests: XCTestCase {
    func test_try1() {
        let tag: String? = nil
        print(tag?.count ?? 0)

        var b = StructDemo.AdConfig(unitId: "banner_home")
        let a = b
        b.timeoutMs = 5_000
        print(a.timeoutMs, b.timeoutMs)
        print(MemoryLayout<Int?>.size)
    }

    func test_try2() {
        // Try more here
    }
}
