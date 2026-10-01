import Foundation

// Exercise 2 — extension

extension Int {
    /// 2.1 999 → "999", 1000 → "1K", 1500 → "1.5K", 12300 → "12.3K", 2000000 → "2M", 3400000 → "3.4M"
    /// Round to 1 decimal place, drop ".0".
    var compactString: String {
        return "" // TODO: Ex02.1
    }
}

extension String {
    /// 2.2 Valid when it has the form: ca-app-pub-<16 digits>/<10 digits>
    /// Hint: range(of:options: .regularExpression) with ^ and $
    var isValidAdUnitId: Bool {
        return false // TODO: Ex02.2
    }
}

extension Optional where Wrapped == String {
    /// 2.3 nil or whitespace-only → "-", otherwise return the string itself.
    var orDash: String {
        return "" // TODO: Ex02.3
    }
}
