import Foundation

// Exercise 1 — Optional
// Run the tests: MobileLearningTests/Lesson01/Ex01OptionalTests.swift → click ◇ next to the class name (or ⌘U)
// Rules: do NOT use `!` — only ?.  ??  if let / guard let  map / flatMap
// The functions below return placeholder values so the project compiles. Replace them with real code.

struct AdUser {
    var name: String?
    var country: String?
}

/// 1.1 Return name if it's non-nil and not empty/whitespace-only; otherwise "Guest".
func displayName(_ user: AdUser?) -> String {
//    user?.name.flatMap{
//        $0.allSatisfy(\.isWhitespace) ? nil : $0
//    } ?? "Guest"
    guard let name = user?.name, !name.allSatisfy(\.isWhitespace) else { return "Guest" }
    return name
}

/// 1.2 Parse a bid price: "0.35" → 0.35. nil, malformed, or negative → nil.
func parseBid(_ raw: String?) -> Double? {
    guard let raw else { return nil }
    guard let number = Double(raw), number >= 0 else { return nil }
    return number
//    return raw.flatMap { Double($0).flatMap { $0 >= 0 ? $0 : nil } }
}

/// 1.3 Return country; if user is nil OR country is nil → "VN". Write it as a single expression.
func countryOrDefault(_ user: AdUser?) -> String {
    return user?.country ?? "VN"
}
