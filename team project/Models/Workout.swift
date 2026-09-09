import Foundation

struct Workout: Identifiable, Hashable {
    let id: UUID
    let name: String
    let summary: String
    let durationMinutes: Int
    let difficulty: String
    let estimatedCalories: Int
    let goal: String

    init(
        id: UUID = UUID(),
        name: String,
        summary: String,
        durationMinutes: Int,
        difficulty: String,
        estimatedCalories: Int,
        goal: String
    ) {
        self.id = id
        self.name = name
        self.summary = summary
        self.durationMinutes = durationMinutes
        self.difficulty = difficulty
        self.estimatedCalories = estimatedCalories
        self.goal = goal
    }
}

extension Workout {
    static let easyParkRun = Workout(
        name: "20-min Easy Park Run",
        summary: "Beginner friendly · Build endurance",
        durationMinutes: 20,
        difficulty: "Rookie",
        estimatedCalories: 214,
        goal: "Build endurance"
    )

    static let firstRun = Workout(
        name: "First Run",
        summary: "Gentle introduction to kinetic breathing.",
        durationMinutes: 15,
        difficulty: "Rookie",
        estimatedCalories: 140,
        goal: "Build confidence"
    )

    static let sevenMinuteInterval = Workout(
        name: "Seven-Minute Interval",
        summary: "High-intensity bursts for maximum burn.",
        durationMinutes: 7,
        difficulty: "Rookie",
        estimatedCalories: 320,
        goal: "Improve speed"
    )
}
