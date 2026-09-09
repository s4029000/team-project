import SwiftUI

struct SessionControlButton: View {
    let systemImage: String
    let accessibilityText: String
    var prominent = false
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Image(systemName: systemImage)
                .font(.headline)
                .foregroundStyle(.white)
                .frame(width: prominent ? 64 : 48, height: prominent ? 64 : 48)
                .background(prominent ? Color.orange : Color.white.opacity(0.08), in: Circle())
        }
        .accessibilityLabel(accessibilityText)
    }
}
