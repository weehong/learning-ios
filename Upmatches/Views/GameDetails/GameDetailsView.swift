import SwiftUI

struct GameDetailsView: View {
  let game: Game

  var body: some View {
    VStack(spacing: 8) {
      GameEventView(name: game.name)
      OrganizerDetailsView(owner: game.owner)
      PlayerListView()
      EventDetails(game: game)
      ActionButton()
    }
    .padding()
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

  return GameDetailsView(game: game)
}
