import Foundation

struct AdUser {
    var name: String?
    var country: String?
}

func displayName(_ user: AdUser?) -> String {
    guard let name = user?.name, !name.trimmingCharacters(in: .whitespaces).isEmpty else { return "Guest" }
    return name
}

func parseBid(_ raw: String?) -> Double? {
    raw.flatMap(Double.init).flatMap { $0 >= 0 ? $0 : nil }
}

func countryOrDefault(_ user: AdUser?) -> String {
    user?.country ?? "VN"
}
