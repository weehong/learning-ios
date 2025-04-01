import SwiftUI

struct EventDetails: View {
  let game: Game

  private var formattedDate: String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"
    guard let date = dateFormatter.date(from: game.date) else { return game.date }

    dateFormatter.dateFormat = "EEEE"
    let dayOfWeek = dateFormatter.string(from: date)

    dateFormatter.dateFormat = "d MMMM"
    let datePart = dateFormatter.string(from: date)

    return "\(dayOfWeek)\n\(datePart)"
  }

  private var formattedTime: String {
    let timeFormatter = DateFormatter()
    timeFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"

    let start = timeFormatter.date(from: game.startTime) ?? Date()
    let end = timeFormatter.date(from: game.endTime) ?? Date()

    let outputFormatter = DateFormatter()
    outputFormatter.dateStyle = .none
    outputFormatter.timeStyle = .short

    return "\(outputFormatter.string(from: start)) ~ \(outputFormatter.string(from: end))"
  }

  var body: some View {
    VStack(alignment: .leading, spacing: 12) {
      DetailRow(icon: "mappin.circle", text: game.venue.name)

      DetailRow(icon: "calendar", text: formattedDate)

      DetailRow(icon: "clock", text: formattedTime)

      DetailRow(icon: "dollarsign.circle", text: "SGD \(String(format: "%.2f", game.price))")

      DetailRow(
        icon: "chart.bar",
        text: game.fromSkill.name == game.toSkill.name
          ? "\(game.fromSkill.name) only" : "\(game.fromSkill.name) - \(game.toSkill.name)")

      DetailRow(icon: "gamecontroller", text: game.gameType.name)
    }
    .frame(maxWidth: .infinity, alignment: .leading)
    .padding(.vertical, 4)
  }
}

struct DetailRow: View {
  let icon: String
  let text: String

  var body: some View {
    HStack(alignment: .center, spacing: 16) {
      Image(systemName: icon)
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width: 20, height: 20)
        .foregroundColor(.appTheme.appColor)

      Text(text)
        .font(FontFamily.HafferTRIAL.regular.swiftUIFont(size: 15))
        .foregroundColor(.primary)
        .fixedSize(horizontal: false, vertical: true)
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

    let game = Game(
      id: 1,
      owner: owner,
      activityId: 1,
      activity: Activity(name: "Badminton"),
      venueId: 1,
      venue: Venue(name: "Choa Chu Kang Sports Hall", address: "1 Choa Chu Kang Street 53"),
      gameTypeId: 1,
      gameType: GameType(name: "Open For All"),
      fromSkillId: 1,
      fromSkill: Skill(name: "Beginner"),
      toSkillId: 2,
      toSkill: Skill(name: "Intermediate"),
      name: "Badminton Game Event",
      date: "2025-05-25",
      startTime: "2025-05-25T20:00:00",
      endTime: "2025-05-25T22:00:00",
      price: 8.00,
      slot: 7,
      remarks: nil,
      isDeleted: false,
      createdAt: "",
      updatedAt: "",
      deletedAt: nil
    )
    
  EventDetails(
    game: game
  )
  .padding()
}
