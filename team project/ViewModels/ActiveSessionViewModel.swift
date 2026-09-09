import Foundation

final class ActiveSessionViewModel: ObservableObject {
    @Published private(set) var elapsedSeconds = 522
    @Published private(set) var isPaused = false

    let distanceKilometres = 1.6
    let heartRate = 142
    let calories = 138
    let cadence = 1_840

    var formattedElapsedTime: String {
        String(format: "%02d:%02d", elapsedSeconds / 60, elapsedSeconds % 60)
    }

    func togglePause() {
        isPaused.toggle()
    }

    func recordLap() {
        // Lap persistence will be connected when the session service is added.
    }

    func stopWorkout() {
        isPaused = true
    }
}
