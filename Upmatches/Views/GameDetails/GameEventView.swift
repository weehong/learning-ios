import SwiftUI

struct GameEventView: View {
  let name: String

  var body: some View {
    Text(name)
      .font(FontFamily.HafferTRIAL.bold.swiftUIFont(size: 22))
      .foregroundStyle(.app)
      .frame(maxWidth: .infinity, alignment: .leading)
      .lineLimit(1)
      .truncationMode(.tail)
      .textCase(.uppercase)
  }
}

#Preview {
  return GameEventView(name: "John Doe")
    .padding()
}
