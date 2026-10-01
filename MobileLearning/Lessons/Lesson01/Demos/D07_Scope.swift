import Foundation

/// 7. "Scope functions" in Swift
///
/// Swift has no let/run/with/apply/also. The equivalent idioms:
///
///  Kotlin                    | Swift
///  --------------------------|--------------------------------------------------
///  x?.let { f(it) }          | x.map { f($0) }   or   if let x { f(x) }
///  x?.let { g(it) } (→ T?)   | x.flatMap { g($0) }
///  run { ... }               | let v: T = { ... }()   (immediately invoked closure)
///  apply { ... }             | configured(value) { $0.field = ... }   (hand-written helper, uses inout)
///  also { log(it) }          | split into a separate statement — Swift favors explicitness
enum ScopeDemo {
    struct AdRequest {
        var unitId = ""
        var keywords: [String] = []
        var testMode = false
    }

    /// An `apply`-style helper: takes a copy, lets you modify it via inout, returns the modified copy.
    static func configured<T>(_ value: T, _ update: (inout T) -> Void) -> T {
        var copy = value
        update(&copy)
        return copy
    }

    static func run() -> [String] {
        var out: [String] = []

        let request = configured(AdRequest()) {
            $0.unitId = "banner_home"
            $0.keywords.append("puzzle")
            $0.testMode = true
        }
        out.append("configured (≈ apply): \(request)")

        let rawKeyword: String? = "  Casual Game "
        let normalized = rawKeyword.map { $0.trimmingCharacters(in: .whitespaces).lowercased() }
        out.append("map (≈ ?.let): \"\(rawKeyword ?? "")\" → \"\(normalized ?? "")\"")

        let isValid: Bool = {
            guard !request.unitId.isEmpty else { return false }
            return !request.keywords.isEmpty
        }()
        out.append("immediately invoked closure (≈ run): isValid = \(isValid)")

        let portText: String? = "8080"
        let port = portText.flatMap { Int($0) }          // Int(_:) returns Int? → flatMap avoids Int??
        out.append("flatMap: \"8080\" → \(String(describing: port))")
        return out
    }
}
