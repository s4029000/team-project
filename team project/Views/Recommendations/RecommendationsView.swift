import SwiftUI

struct RecommendationsView: View {
    @State private var viewModel = RecommendationsViewModel()

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                header
                searchField
                FeaturedWorkoutCard(workout: viewModel.featuredWorkout)

                Text("More For You")
                    .font(.title2.bold())

                LazyVStack(spacing: 12) {
                    ForEach(viewModel.filteredWorkouts) { workout in
                        NavigationLink(value: workout) {
                            WorkoutRow(workout: workout)
                        }
                        .buttonStyle(.plain)
                    }
                }
            }
            .padding()
        }
        .background(Color(red: 0.035, green: 0.035, blue: 0.055))
        .foregroundStyle(.white)
        .navigationDestination(for: Workout.self) { workout in
            ActiveSessionView(workout: workout)
        }
        .toolbar(.hidden, for: .navigationBar)
    }

    private var header: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 7) {
                Text("Today’s Pick")
                    .font(.largeTitle.bold())

                Text("Personalized performance recommendations based on your recent activity.")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }

            Spacer()
            ProfileButton()
        }
    }

    private var searchField: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundStyle(.secondary)

            TextField("Search exercises", text: $viewModel.searchText)
                .textInputAutocapitalization(.never)
        }
        .padding()
        .background(Color.white.opacity(0.07))
        .clipShape(RoundedRectangle(cornerRadius: 18))
    }
}

struct RecommendationsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            RecommendationsView()
        }
        .preferredColorScheme(.dark)
    }
}
