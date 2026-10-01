import Foundation

/// 2. extension
///
/// Extensions in Swift are a bit more powerful than in Kotlin:
///  - add computed properties, methods, inits, subscripts, nested types
///  - add protocol CONFORMANCE to existing types (Kotlin can't do this)
///  - conditional constraints: `extension Array where Element == Double`
/// You can't add stored properties (there's no room in the original type's memory layout).
enum ExtensionDemo {
    struct AdSize { let width: Int; let height: Int }

    static func run() -> [String] {
        var out: [String] = []
        out.append("\"ca-app-pub-3940256099942544/6300978111\".isAdUnitId = \("ca-app-pub-3940256099942544/6300978111".isAdUnitId)")
        out.append("\"abc\".isAdUnitId = \("abc".isAdUnitId)")

        let missing: String? = nil
        out.append("missing.orDashDemo = \(missing.orDashDemo)   // extension on Optional")

        let banner = AdSize(width: 320, height: 50)
        out.append("\"\\(banner)\" = \(banner)   // thanks to an extension adding CustomStringConvertible")

        out.append("[1.2, 0.8, 1.0].average = \([1.2, 0.8, 1.0].average)   // only exists on [Double]")
        // ["a"].average                    // ❌ doesn't exist: constrained to Element == Double
        return out
    }
}

extension String {
    var isAdUnitId: Bool {
        range(of: #"^ca-app-pub-\d{16}/\d{10}$"#, options: .regularExpression) != nil
    }
}

extension Optional where Wrapped == String {
    var orDashDemo: String {   // demo version; exercise Ex02 has you write orDash yourself
        guard let value = self, !value.trimmingCharacters(in: .whitespaces).isEmpty else { return "-" }
        return value
    }
}

extension ExtensionDemo.AdSize: CustomStringConvertible {
    var description: String { "\(width)x\(height)" }
}

extension Array where Element == Double {
    var average: Double { isEmpty ? 0 : reduce(0, +) / Double(count) }
}
