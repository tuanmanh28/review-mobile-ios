import SwiftUI

/// One app for the whole roadmap. Pick an iPhone simulator, then ⌘R.
@main
struct MobileLearningApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
        }
    }
}
