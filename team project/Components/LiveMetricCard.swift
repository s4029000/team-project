import SwiftUI

struct LiveMetricCard: View {
    let icon: String
    let title: String
    let value: String
    var highlighted = false

    var body: some View {
        VStack(spacing: 9) {
            Label(title.uppercased(), systemImage: icon)
                .font(.caption2.bold())
                .foregroundStyle(highlighted ? .orange : .secondary)

            Text(value)
                .font(.headline)
                .foregroundStyle(highlighted ? .orange : .white)
        }
        .frame(maxWidth: .infinity, minHeight: 88)
        .background(highlighted ? Color.orange.opacity(0.16) : Color.white.opacity(0.07))
    }
}
