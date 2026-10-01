/// A runnable example: returns output lines to show on screen or print when running tests.
struct Demo: Identifiable {
    let id: String
    let title: String
    /// The equivalent concept on Android
    let counterpart: String
    let run: () -> [String]
}

/// A lesson in the roadmap.
struct Lesson: Identifiable {
    let number: Int
    let title: String
    let summary: String
    let demos: [Demo]
    var id: Int { number }
}

/// The lessons shown in the app.
/// To add a lesson: create a Lessons/LessonNN folder (Xcode picks up the files automatically, no drag-and-drop needed), then add one line here.
enum Lessons {
    static let all: [Lesson] = [
        Lesson01.lesson,
        // Lesson02.lesson,  // Memory management
    ]
}
