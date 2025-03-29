import SwiftUI

struct ContentView: View {
  @State private var isNavigationActive = false

  var body: some View {
    NavigationStack {
      VStack {
        VStack {
          Text("Upmatches")
            .font(FontFamily.HafferTRIAL.bold.swiftUIFont(size: 34))
          Text("Meet & play with like-minded sports people like you")
            .font(FontFamily.HafferTRIAL.semiBold.swiftUIFont(size: 20))
            .foregroundStyle(.secondary)
            .multilineTextAlignment(.center)
            .padding(.top, 4)
        }
        .frame(maxHeight: .infinity)

        Spacer()

        Button(action: {
          isNavigationActive = true
        }) {
          Text("Login")
            .font(FontFamily.HafferTRIAL.semiBold.swiftUIFont(size: 17))
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .padding()
            .background(.app)
            .cornerRadius(25)
            .textCase(.uppercase)
        }
        .navigationDestination(isPresented: $isNavigationActive) {
          GameListView()
        }
      }
      .frame(maxWidth: .infinity)
      .padding()
    }
  }
}

#Preview {
  ContentView()
}
