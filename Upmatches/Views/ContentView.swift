import SwiftUI
import Auth0

struct ContentView: View {
    @State private var isAuthenticated = false
    @State private var isAuthChecked = false
    
    var body: some View {
        Group {
            if isAuthenticated {
                MainTabView(isAuthenticated: $isAuthenticated)
            } else {
                LoginView(isAuthenticated: $isAuthenticated)
            }
        }
        .onAppear {
            if !isAuthChecked {
                checkAuth()
                isAuthChecked = true
            }
        }
    }
    
    private func checkAuth() {
        let credentialsManager = CredentialsManager(authentication: Auth0.authentication())
        credentialsManager.credentials { result in
            switch result {
            case .success:
                isAuthenticated = true
            case .failure:
                isAuthenticated = false
            }
        }
    }
}

#Preview {
    ContentView()
}
