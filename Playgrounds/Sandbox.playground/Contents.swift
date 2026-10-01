// Playground: each line's result shows up right away in the right-hand column.
// Run: click ▶ next to a line number to run up to that line, or ⇧⌘↩ to run everything.
// The playground is separate and can't see the app's code — copy the snippet you want to try in here.
import Foundation

let tag: String? = nil
tag?.count ?? 0

struct AdConfig { var unitId: String; var timeoutMs = 3_000 }
var b = AdConfig(unitId: "banner_home")
let a = b
b.timeoutMs = 5_000
a.timeoutMs
b.timeoutMs

MemoryLayout<Int?>.size
MemoryLayout<String?>.size
