import SwiftUI

struct ContactView: View {
    let owner: Owner

    private enum SocialPlatform {
        case messenger
        case whatsApp
        case telegram
        case chat

        var iconName: String {
            switch self {
            case .chat: return "Chat"
            case .messenger: return "Messenger"
            case .whatsApp: return "WhatsApp"
            case .telegram: return "Telegram"
            }
        }

        func url(for owner: Owner) -> URL? {
            switch self {
            case .messenger:
                return URL(string: "https://m.me/\(owner.messengerId)")
            case .whatsApp:
                return URL(string: "https://wa.me/\(owner.whatsappId)")
            case .telegram:
                return URL(string: "https://t.me/\(owner.telegramId)")
            default:
                return nil
            }
        }
    }

    var body: some View {
        VStack {
            HStack(spacing: 16) {
                Button(action: {
            
                }) {
                    Image(SocialPlatform.chat.iconName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 25, height: 25)
                        .foregroundColor(.appTheme.appColor)
                }
                .buttonStyle(.plain)
          
                ForEach(
                    [SocialPlatform.messenger, .whatsApp, .telegram, .chat],
                    id: \.self
                ) { platform in
                    if let url = platform.url(for: owner) {
                        Button(action: {
                            UIApplication.shared.open(url)
                        }) {
                            Image(platform.iconName)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 25, height: 25)
                                .foregroundColor(.appTheme.appColor)
                        }
                        .buttonStyle(.plain)
                    }
                }
            }
        }
    }
}

#Preview {
    let sampleOwner = Owner(
        name: "John Doe",
        email: "john@example.com",
        isOwner: true,
        telegramId: "johndoe",
        messengerId: "100123456789",
        whatsappId: "98765432"
    )

    return ContactView(owner: sampleOwner)
        .padding()
}
