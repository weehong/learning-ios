import SwiftUI
import Auth0

struct LoginView: View {
    @State private var isLoading = false
    @State private var showAlert = false
    @State private var authError: Error?
    @Binding var isAuthenticated: Bool
    
    private let credentialsManager = CredentialsManager(authentication: Auth0.authentication())
    
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
                
                Button {
                    Task { await login() }
                } label: {
                    HStack {
                        if isLoading {
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle(tint: .white))
                        } else {
                            Text("Login / Create Account")
                                .font(FontFamily.HafferTRIAL.regular.swiftUIFont(size: 17))
                                .foregroundColor(.white)
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.app)
                    .cornerRadius(25)
                }
                .disabled(isLoading)
            }
            .padding()
            .alert("Login Error", isPresented: $showAlert) {
                Button("OK", role: .cancel) {}
            } message: {
                Text(authError?.localizedDescription ?? "Unknown error")
            }
        }
    }
    
    @MainActor
    private func login() async {
        isLoading = true
        defer { isLoading = false }
        
        await withCheckedContinuation { continuation in
            Auth0
                .webAuth()
                .start { result in
                    switch result {
                    case .failure(let error):
                        authError = error
                        showAlert = true
                        
                    case .success(let credentials):
                        _ = credentialsManager.store(credentials: credentials)
                        isAuthenticated = true
                    }
                    continuation.resume()
                }
        }
    }
}
