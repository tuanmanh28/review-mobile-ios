import Foundation

// Exercise 7 — scope function equivalents

struct AdRequest: Equatable {
    var unitId = ""
    var keywords: [String] = []
    var testMode = false
}

/// 7.1 A Kotlin `apply`-style helper: copy `value`, let `update` modify it via inout, return the modified copy.
func configured<T>(_ value: T, _ update: (inout T) -> Void) -> T {
    return value // TODO: Ex07.1
}

/// 7.2 Use configured(...) to build a request with unitId, keywords, testMode = true.
func buildRequest(unitId: String, keywords: [String]) -> AdRequest {
    return AdRequest() // TODO: Ex07.2
}

/// 7.3 "  Casual Game " → "casual game"; nil or whitespace-only → nil. Use map / flatMap, no if.
func normalizeKeyword(_ raw: String?) -> String? {
    return "TODO" // TODO: Ex07.3
}
