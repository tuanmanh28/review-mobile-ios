import Foundation

extension Int {
    var compactString: String {
        func format(_ value: Double, _ suffix: String) -> String {
            let rounded = (value * 10).rounded() / 10
            var text = "\(rounded)"
            if text.hasSuffix(".0") { text.removeLast(2) }
            return text + suffix
        }
        switch self {
        case 1_000_000...: return format(Double(self) / 1_000_000, "M")
        case 1_000...: return format(Double(self) / 1_000, "K")
        default: return "\(self)"
        }
    }
}

extension String {
    var isValidAdUnitId: Bool {
        range(of: #"^ca-app-pub-\d{16}/\d{10}$"#, options: .regularExpression) != nil
    }
}

extension Optional where Wrapped == String {
    var orDash: String {
        guard let value = self, !value.trimmingCharacters(in: .whitespaces).isEmpty else { return "-" }
        return value
    }
}
