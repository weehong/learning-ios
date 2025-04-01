import SwiftUI

struct GameListView: View {
    @State private var games: [Game] = []
    @State private var isLoading: Bool = false
    @State private var errorMessage: String?
    
    var body: some View {
        ScrollView {
            if isLoading {
                ProgressView("Loading games...")
            } else if let errorMessage = errorMessage {
                Text("Error: \(errorMessage)")
                    .foregroundColor(.red)
            } else if games.isEmpty {
                Text("No games available")
            } else {
                ForEach(games) { game in
                    GameDetailsView(game: game)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(
                                    Color.appTheme.borderColor,
                                    lineWidth: 1
                                )
                        )
                        .padding(.bottom)
                }
            }
        }
        .safeAreaPadding()
        .task {
            await loadGames()
        }
    }

    private func loadGames() async {
        isLoading = true
        errorMessage = nil

        let jsonString = """
      {"status":200,"message":null,"data":[{"id":2,"owner":{"name":"Wee Hong, Vernon KOH","email":"weehongkane@gmail.com","isOwner":false,"telegramId":"vernonweehong","messengerId":"100010140369871","whatsappId":"88730242"},"activityId":1,"activity":{"name":"Badminton"},"venueId":25,"venue":{"name":"Choa Chu Kang Sport Hall","address":"1 CHOA CHU KANG STREET 53 CHOA CHU KANG SPORT CENTRE SINGAPORE 689236"},"gameTypeId":1,"gameType":{"name":"Open For All"},"fromSkillId":4,"fromSkill":{"name":"Low Intermediate"},"toSkillId":4,"toSkill":{"name":"Low Intermediate"},"name":"Badminton Game","date":"2025-03-16","startTime":"2025-03-16T20:00:00","endTime":"2025-03-16T12:00:00","price":8.00,"slot":7,"remarks":null,"isDeleted":false,"createdAt":"2025-03-14T21:23:25","updatedAt":"2025-03-14T21:23:25","deletedAt":null},{"id":3,"owner":{"name":"Wee Hong, Vernon KOH","email":"weehongkane@gmail.com","isOwner":false,"telegramId":"vernonweehong","messengerId":"100010140369871","whatsappId":"88730242"},"activityId":1,"activity":{"name":"Badminton"},"venueId":15,"venue":{"name":"Bukit Gombak Sport Hall","address":"810 BUKIT BATOK WEST AVENUE 5 BUKIT GOMBAK SPORT CENTRE SINGAPORE 659088"},"gameTypeId":1,"gameType":{"name":"Open For All"},"fromSkillId":4,"fromSkill":{"name":"Low Intermediate"},"toSkillId":4,"toSkill":{"name":"Low Intermediate"},"name":"Badminton Game","date":"2025-03-23","startTime":"2025-03-23T09:00:00","endTime":"2025-03-23T12:00:00","price":8.00,"slot":7,"remarks":"Advance payment required","isDeleted":false,"createdAt":"2025-03-14T21:41:40","updatedAt":"2025-03-14T21:41:40","deletedAt":null},{"id":4,"owner":{"name":"Wee Hong, Vernon KOH","email":"weehongkane@gmail.com","isOwner":false,"telegramId":"vernonweehong","messengerId":"100010140369871","whatsappId":"88730242"},"activityId":1,"activity":{"name":"Badminton"},"venueId":1,"venue":{"name":"Admiralty Primary School Hall","address":"11 WOODLANDS CIRCLE ADMIRALTY PRIMARY SCHOOL SINGAPORE 738907"},"gameTypeId":1,"gameType":{"name":"Open For All"},"fromSkillId":1,"fromSkill":{"name":"Beginner"},"toSkillId":2,"toSkill":{"name":"Mid Beginner"},"name":"Badminton Game","date":"2025-03-26","startTime":"2025-03-26T09:00:00","endTime":"2025-03-26T12:00:00","price":8.00,"slot":7,"remarks":null,"isDeleted":false,"createdAt":"2025-03-25T18:40:02","updatedAt":"2025-03-25T18:40:02","deletedAt":null}]}
      """

        do {
            let data = jsonString.data(using: .utf8)!
            let response = try JSONDecoder().decode(
                ApiResponse.self,
                from: data
            )
            games = response.data
        } catch {
            errorMessage = error.localizedDescription
            print("Decoding error: \(error)")
        }

        isLoading = false
    }
}

#Preview {
    GameListView()
}
