import SwiftUI

struct PlayerListView: View {
  var body: some View {
    VStack {
      ScrollView(.horizontal, showsIndicators: false) {
        HStack {
          ForEach(0..<10) { index in
            Image(systemName: "person.circle.fill")
              .resizable()
              .scaledToFit()
              .frame(width: 40, height: 40)
              .foregroundColor(.secondary)
          }
        }
      }
      .padding(.bottom, 8)

      Text("10/20 players")
        .font(FontFamily.HafferTRIAL.regular.swiftUIFont(size: 11))
        .foregroundStyle(.secondary)
        .frame(
          maxWidth: .infinity,
          alignment: .leading
        )
    }
    .padding(.vertical, 8)
    .overlay(
      VStack {
        Divider()
        Spacer()
        Divider()
      }
      .foregroundColor(.secondary)
    )
  }
}

#Preview {
  PlayerListView()
}
