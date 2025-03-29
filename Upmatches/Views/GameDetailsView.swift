import SwiftUI

enum SocialMediaPlatform: String, CaseIterable {
  case messenger = "Messenger"
  case whatsApp = "WhatsApp"
  case telegram = "Telegram"

  var icon: Image {
    switch self {
    case .messenger: return Asset.messenger.swiftUIImage
    case .whatsApp: return Asset.whatsApp.swiftUIImage
    case .telegram: return Asset.telegram.swiftUIImage
    }
  }

  var url: URL {
    switch self {
    case .messenger: return URL(string: "https://m.me/username")!
    case .whatsApp: return URL(string: "https://wa.me/123456789")!
    case .telegram: return URL(string: "https://t.me/username")!
    }
  }
}

struct GameDetailsView: View {
  var body: some View {
    VStack(spacing: 8) {
      GameEventView()
      OrganizerDetailsView()
      EventDetails()
      ActionButton()
    }
    .padding()
    .cornerRadius(8)
    .border(Color.appTheme.borderColor)
  }
}

struct GameEventView: View {
  var body: some View {
    Text("Badminton Game Event")
      .font(FontFamily.HafferTRIAL.bold.swiftUIFont(size: 22))
      .foregroundStyle(.app)
      .frame(
        maxWidth: .infinity,
        alignment: .leading
      )
  }
}

struct OrganizerDetailsView: View {
  let socialMediaPlatforms = [
    ("Messenger", "Messenger", URL(string: "https://m.me/username")!),
    (
      "bubble.left.fill",
      "WhatsApp",
      URL(string: "https://wa.me/123456789")!
    ),
    ("paperplane.fill", "Telegram", URL(string: "https://t.me/username")!),
  ]

  var body: some View {
    HStack {
      Text("Organized By: John Doe")
        .font(FontFamily.HafferTRIAL.regular.swiftUIFont(size: 15))
        .foregroundStyle(.gray)
        .frame(
          maxWidth: .infinity,
          alignment: .leading)
      SocialMediaButtons()
    }
  }
}

struct EventDetails: View {
  var body: some View {
    HStack(spacing: 0) {
      Text("Icon")
        .frame(width: UIScreen.main.bounds.width * 2 / 10)
        .background(.red)
      Text("Choa Chu Kang Sports Hall")
        .frame(maxWidth: .infinity)
        .background(.gray)
    }
    .frame(maxWidth: .infinity)
    .padding(.bottom)
  }
}

struct ActionButton: View {
  var body: some View {
    HStack {
      Button(action: {}) {
        Text("View Details")
          .foregroundColor(Color.appTheme.appColor)
          .frame(maxWidth: .infinity)
          .padding()
          .clipShape(Capsule())
          .overlay(
            Capsule()
              .stroke(Color.appTheme.appColor, lineWidth: 2)
          )
      }
      .frame(maxWidth: .infinity)

      Button(action: {}) {
        Text("Join")
          .font(FontFamily.HafferTRIAL.regular.swiftUIFont(size: 17))
          .foregroundColor(.white)
          .frame(maxWidth: .infinity)
          .padding()
          .background(.app)
          .clipShape(Capsule())
      }
      .frame(maxWidth: .infinity)
    }
    .frame(maxWidth: .infinity)
  }
}

struct SocialMediaButtons: View {
  var body: some View {
    ForEach(SocialMediaPlatform.allCases, id: \.self) { platform in
      Button {
        UIApplication.shared.open(platform.url)
      } label: {
        platform.icon
          .resizable()
          .frame(width: 30, height: 30)
      }
      .buttonStyle(.plain)
    }
  }
}

#Preview {
  GameDetailsView()
}
