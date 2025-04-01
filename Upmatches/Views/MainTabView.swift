import SwiftUI
import Auth0

import SwiftUI

struct MainTabView: View {
    @Binding var isAuthenticated: Bool
    @State private var selection = 0
    @State private var showCreateGameSheet = false
    
    var body: some View {
        ZStack(alignment: .bottom) {
            // Main TabView content
            TabView(selection: $selection) {
                GameListView()
                    .tabItem {
                        Label("Games", systemImage: "sportscourt")
                    }
                    .tag(0)
                
                MessagesView()
                    .tabItem {
                        Label("Messages", systemImage: "message")
                    }
                    .tag(1)
                    .badge(2)
                
                Text("")
                    .tabItem {
                        Image(systemName: "")
                    }
                    .tag(2)
                
                ProfileView()
                    .tabItem {
                        Label("Profile", systemImage: "person")
                    }
                    .tag(3)
                
                SettingsView(isAuthenticated: $isAuthenticated)
                    .tabItem {
                        Label("Settings", systemImage: "gear")
                    }
                    .tag(4)
            }
            .tint(Color.app)
            
            // Floating circular plus button
            Button(action: {
                showCreateGameSheet = true
            }) {
                ZStack {
                    Circle()
                        .fill(Color.clear)
                        .frame(width: 56, height: 56)
                    
                    Circle()
                        .fill(Color.app)
                        .frame(width: 50, height: 50)
                    
                    Image(systemName: "plus")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundColor(.white)
                }
            }
            .offset(y: 8)
        }
        .sheet(isPresented: $showCreateGameSheet) {
            CreateGameView()
                .presentationDetents([.medium, .large])
                .presentationDragIndicator(.visible)
        }
        .onAppear {
            let appearance = UITabBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = UIColor(Color(.systemBackground))
            UITabBar.appearance().standardAppearance = appearance
            UITabBar.appearance().scrollEdgeAppearance = appearance
        }
    }
}

struct MessagesView : View {
    var body: some View {
        Text("Message View")
    }
}

struct ProfileView : View {
    var body: some View {
        Text("Profile View")
    }
}

struct SettingsView: View {
    @Binding var isAuthenticated: Bool
    private let credentialsManager = CredentialsManager(
        authentication: Auth0.authentication()
    )
    
    var body: some View {
        Button("Logout") {
            Task { await logout() }
        }
    }
    
    @MainActor
    private func logout() async {
        await withCheckedContinuation { continuation in
            Auth0
                .webAuth()
                .clearSession { result in
                    credentialsManager.revoke { _ in
                        isAuthenticated = false
                    }
                    continuation.resume()
                }
        }
    }
}

#Preview {
    MainTabView(isAuthenticated: .constant(true))
}
