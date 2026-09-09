import SwiftUI

struct ProfileButton: View {
    var body: some View {
        Button(action: {}) {
            Image(systemName: "person.crop.circle.fill")
                .font(.system(size: 34))
                .foregroundStyle(Color(red: 1, green: 0.78, blue: 0.72))
        }
        .accessibilityLabel("Open profile")
    }
}
