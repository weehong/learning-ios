import SwiftUI

// MARK: - Data Models
struct Owner: Codable {
  let name: String
  let email: String
  let isOwner: Bool
  let telegramId: String
  let messengerId: String
  let whatsappId: String
}

struct Activity: Codable {
  let name: String
}

struct Venue: Codable {
  let name: String
  let address: String
}

struct GameType: Codable {
  let name: String
}

struct Skill: Codable {
  let name: String
}

struct Game: Codable, Identifiable {
  let id: Int
  let owner: Owner
  let activityId: Int
  let activity: Activity
  let venueId: Int
  let venue: Venue
  let gameTypeId: Int
  let gameType: GameType
  let fromSkillId: Int
  let fromSkill: Skill
  let toSkillId: Int
  let toSkill: Skill
  let name: String
  let date: String
  let startTime: String
  let endTime: String
  let price: Double
  let slot: Int
  let remarks: String?
  let isDeleted: Bool
  let createdAt: String
  let updatedAt: String
  let deletedAt: String?
}

struct ApiResponse: Codable {
  let status: Int
  let message: String?
  let data: [Game]
}
