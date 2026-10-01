# Review Mobile — iOS

> Part of [review-mobile](https://github.com/tuanmanh28/review-mobile) · Android: [review-mobile-android](https://github.com/tuanmanh28/review-mobile-android) · iOS: [review-mobile-ios](https://github.com/tuanmanh28/review-mobile-ios)

The iOS project for the mobile learning roadmap (Swift / SwiftUI).

```
MobileLearning/
├── App/                     SwiftUI app + Lesson.swift (LESSON REGISTRY)
└── Lessons/Lesson01/        Lesson 1: Demos/ + Exercises/ + Lesson01.swift
MobileLearningTests/Lesson01/   grading tests + DemoTests
Solutions/Lesson01/          solutions (outside the target, not built)
Playgrounds/Sandbox.playground  a scratchpad for quick experiments
```

## First run (requires Xcode 16 or later)

1. Open `MobileLearning.xcodeproj`, pick the `MobileLearning` scheme and an iPhone simulator.
2. ⌘R runs the app. ⌘U runs all tests; or open the Test navigator (⌘6) to run a single class/function.
3. To run on a real device: target MobileLearning ▸ Signing & Capabilities ▸ choose your Team.

## Working through a lesson

1. Run the lesson's demos (in the app or via `DemoTests`).
2. Fill in the `TODO`s in `Exercises/`.
3. Run the lesson's tests until they're green. Only peek at `Solutions/` after being stuck for 15 minutes.

## Adding a new lesson (e.g. Lesson 2)

- Code: create the `Lessons/Lesson02/` folder — Xcode picks up the files automatically, no drag-and-drop needed
- Register: add `Lesson02.lesson` to `Lessons.all` in `App/Lesson.swift`
- Tests: `MobileLearningTests/Lesson02/`
- Solutions: `Solutions/Lesson02/`

Naming convention to avoid clashes (the whole app is one module): put each demo's types inside `enum XxxDemo { … }`;
put a new lesson's exercises in an `enum L02 { … }` namespace when possible.
