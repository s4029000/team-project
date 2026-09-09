import SwiftUI

struct WorkoutRow: View {
    let workout: Workout

    var body: some View {
        HStack(spacing: 12) {
            RoundedRectangle(cornerRadius: 8)
                .fill(Color.orange.opacity(0.13))
                .frame(width: 58, height: 58)
                .overlay {
                    Image(systemName: "figure.run")
                        .foregroundStyle(.orange)
                }

            VStack(alignment: .leading, spacing: 4) {
                Text("LEVEL: \(workout.difficulty.uppercased())")
                    .font(.caption2.bold())
                    .foregroundStyle(.orange)

                Text(workout.name)
                    .font(.headline)

                Text(workout.summary)
                    .font(.caption)
                    .foregroundStyle(.secondary)
                    .lineLimit(2)
            }

            Spacer(minLength: 8)

            VStack(alignment: .trailing, spacing: 14) {
                Text("\(workout.estimatedCalories) KCAL")
                    .font(.caption2.bold())
                    .foregroundStyle(.orange)

                Image(systemName: "chevron.right")
                    .foregroundStyle(.orange)
            }
        }
        .padding(12)
        .background(Color.white.opacity(0.07))
        .clipShape(RoundedRectangle(cornerRadius: 15))
    }
}
