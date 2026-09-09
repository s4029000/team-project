import SwiftUI

struct FeaturedWorkoutCard: View {
    let workout: Workout

    var body: some View {
        VStack(alignment: .leading, spacing: 14) {
            HStack {
                Text("BEST MATCH")
                    .font(.caption.bold())
                    .foregroundStyle(.orange)
                    .padding(.horizontal, 14)
                    .padding(.vertical, 8)
                    .background(.black.opacity(0.55), in: Capsule())

                Spacer()

                NavigationLink(value: workout) {
                    Image(systemName: "play.fill")
                        .foregroundStyle(.white)
                        .frame(width: 52, height: 52)
                        .background(.orange, in: Circle())
                        .shadow(color: .orange.opacity(0.35), radius: 12)
                }
                .accessibilityLabel("Start \(workout.name)")
            }

            Spacer(minLength: 90)

            Text(workout.name)
                .font(.title2.bold())

            Text(workout.summary)
                .font(.subheadline)
                .foregroundStyle(.secondary)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background {
            LinearGradient(
                colors: [Color(red: 0.16, green: 0.22, blue: 0.22), .orange.opacity(0.14)],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        }
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}
