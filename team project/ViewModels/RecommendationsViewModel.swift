import Foundation
import Combine

final class RecommendationsViewModel: ObservableObject {
    @Published var searchText = ""

    let workouts: [Workout] = [
        .easyParkRun,
        .firstRun,
        .sevenMinuteInterval
    ]

    var featuredWorkout: Workout {
        workouts[0]
    }

    var filteredWorkouts: [Workout] {
        let alternatives = Array(workouts.dropFirst())
        guard !searchText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
            return alternatives
        }

        return alternatives.filter { workout in
            workout.name.localizedCaseInsensitiveContains(searchText)
                || workout.summary.localizedCaseInsensitiveContains(searchText)
        }
    }
}
