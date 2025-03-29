import SwiftUI

struct GameListView: View {
    var body: some View {
        ScrollView {
            GameDetailsView()
        }
        .padding()
    }
}

#Preview {
    GameListView()
}
