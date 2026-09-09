import SwiftUI

struct ActiveSessionView: View {
    let workout: Workout
    @StateObject private var viewModel = ActiveSessionViewModel()

    private let columns = [
        GridItem(.flexible(), spacing: 1),
        GridItem(.flexible(), spacing: 1)
    ]

    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                sessionHeader

                Text(viewModel.formattedElapsedTime)
                    .font(.system(size: 56, weight: .bold, design: .rounded))
                    .monospacedDigit()

                Text("\(workout.name) · Coach Lex")
                    .foregroundStyle(.secondary)

                metricsGrid
                controls
                coachCard
            }
            .padding()
        }
        .background(Color(red: 0.035, green: 0.035, blue: 0.055))
        .foregroundStyle(.white)
        .navigationBarTitleDisplayMode(.inline)
    }

    private var sessionHeader: some View {
        HStack {
            Spacer()
            Text("RUN  ACTIVE")
                .font(.subheadline.bold())
                .padding(.horizontal, 36)
                .padding(.vertical, 9)
                .overlay(Capsule().stroke(.orange.opacity(0.7)))
            Spacer()
            ProfileButton()
        }
    }

    private var metricsGrid: some View {
        LazyVGrid(columns: columns, spacing: 1) {
            LiveMetricCard(icon: "speedometer", title: "Avg Pace", value: "5′24″")
            LiveMetricCard(icon: "location.fill", title: "Distance", value: String(format: "%.1f km", viewModel.distanceKilometres))
            LiveMetricCard(icon: "heart.fill", title: "Heart Rate", value: "\(viewModel.heartRate) bpm", highlighted: true)
            LiveMetricCard(icon: "flame.fill", title: "Calories", value: "\(viewModel.calories) kcal")
            LiveMetricCard(icon: "figure.run", title: "Cadence", value: "\(viewModel.cadence)")
            LiveMetricCard(icon: "clock.fill", title: "Remaining", value: "11:18")
        }
        .background(Color.white.opacity(0.025))
        .clipShape(RoundedRectangle(cornerRadius: 17))
    }

    private var controls: some View {
        HStack {
            SessionControlButton(systemImage: "flag.fill", accessibilityText: "Record lap", action: viewModel.recordLap)
            Spacer()
            SessionControlButton(
                systemImage: viewModel.isPaused ? "play.fill" : "pause.fill",
                accessibilityText: viewModel.isPaused ? "Resume workout" : "Pause workout",
                prominent: true,
                action: viewModel.togglePause
            )
            Spacer()
            SessionControlButton(systemImage: "stop.fill", accessibilityText: "Stop workout", action: viewModel.stopWorkout)
        }
        .padding()
        .background(Color.white.opacity(0.07))
        .clipShape(RoundedRectangle(cornerRadius: 18))
    }

    private var coachCard: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("COACH LEX · LIVE INSTRUCTION")
                .font(.caption.bold())
                .foregroundStyle(.orange)

            HStack {
                Text("Great pace! Keep this effort for the next interval.")
                    .font(.title3.bold())
                Spacer()
                Image(systemName: "waveform")
                    .font(.title2)
                    .foregroundStyle(.orange)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(Color.white.opacity(0.07))
        .clipShape(RoundedRectangle(cornerRadius: 18))
    }
}

#Preview {
    NavigationStack {
        ActiveSessionView(workout: .easyParkRun)
    }
    .preferredColorScheme(.dark)
}
