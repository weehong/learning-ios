import SwiftUI

struct GameDetailsView: View {
    var body: some View {
        VStack(spacing: 0) {
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
    var body : some View {
        Text("Badminton Game Event")
            .fontWeight(.bold)
            .frame(
                maxWidth: .infinity,
                alignment: .leading
            )
    }
}

struct OrganizerDetailsView: View {
    let socialMediaPlatforms = [
        ("message.fill", "Messenger", URL(string: "https://m.me/username")!),
        (
            "bubble.left.fill",
            "WhatsApp",
            URL(string: "https://wa.me/123456789")!
        ),
        ("paperplane.fill", "Telegram", URL(string: "https://t.me/username")!),
        ("envelope.fill", "Email", URL(string: "mailto:contact@example.com")!)
    ]
    
    var body: some View {
        VStack(spacing: 0) {
            Divider() // Top border
            
            VStack {
                HStack {
                    VStack(alignment: .leading, spacing: 8) {
                        HStack(spacing: 16) {
                            ForEach(socialMediaPlatforms, id: \.1) { platform in
                                Button(action: {
                                    UIApplication.shared.open(platform.2)
                                }) {
                                    VStack(spacing: 2) {
                                        Image(systemName: platform.0)
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 20, height: 20)
                                            .foregroundColor(.blue)
                                    }
                                    .frame(width: 20, height: 20)
                                }
                                .buttonStyle(PlainButtonStyle())
                            }
                        }
                        .padding(.top, 4)
                        Text("Organizer Details")
                            .foregroundColor(Color.gray)
                        
                        Text("Vernon Wee Hong KOH")
                            .fontWeight(.bold)
                        
                        
                    }
                    Spacer()
                }
                .padding(.vertical, 12)
            }
            
            Divider() // Bottom border
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
                    .foregroundColor(Color.appTheme.primaryColor)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .clipShape(Capsule())
                    .overlay(
                        Capsule()
                            .stroke(Color.appTheme.primaryColor, lineWidth: 2)
                    )
            }
            .frame(maxWidth: .infinity)

            Button(action: {}) {
                Text("Join")
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.appTheme.primaryColor)
                    .clipShape(Capsule())
            }
            .frame(maxWidth: .infinity)
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    GameDetailsView()
}
