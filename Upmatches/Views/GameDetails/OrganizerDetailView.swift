import SwiftUI

struct OrganizerDetailsView: View {
  let owner: Owner

  var body: some View {
    HStack {
      VStack {
        Text("Organizer")
          .font(FontFamily.HafferTRIAL.regular.swiftUIFont(size: 12))
          .foregroundStyle(.secondary)
          .frame(maxWidth: .infinity, alignment: .leading)
        Text(owner.name)
          .font(FontFamily.HafferTRIAL.semiBold.swiftUIFont(size: 15))
          .frame(maxWidth: .infinity, alignment: .leading)
      }
        ContactView(owner: owner)
    }
  }
}

#Preview {
    let owner = Owner(
      name: "John Doe",
      email: "john@example.com",
      isOwner: true,
      telegramId: "johndoe",
      messengerId: "100123456789",
      whatsappId: "98765432"
    )
    
    OrganizerDetailsView(owner: owner)
        .padding()
}
