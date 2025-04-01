import SwiftUI

struct ActionButton: View {
    @State private var isLoading = false
    
    var body: some View {
        HStack(spacing: 16) {
            Button(action: {
                // Handle view details action
            }) {
                Text("View Details")
                    .font(FontFamily.HafferTRIAL.regular.swiftUIFont(size: 15))
                    .foregroundColor(Color.appTheme.appColor)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 8)
                    .background(
                        Capsule()
                            .stroke(Color.appTheme.appColor, lineWidth: 2)
                    )
            }
            
            Button(action: {
                isLoading = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                    isLoading = false
                }
            }) {
                if isLoading {
                    ProgressView()
                        .tint(.white)
                } else {
                    Text("Join")
                        .font(FontFamily.HafferTRIAL.regular.swiftUIFont(size: 15))
                        .foregroundColor(.white)
                }
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 8)
            .background(
                Capsule()
                    .stroke(Color.appTheme.appColor, lineWidth: 2)
            )
            .background(Color.app)
            .cornerRadius(25)
            .disabled(isLoading)
        }
        .frame(maxWidth: .infinity)
        .padding(.top, 8)
    }
}

#Preview {
    ActionButton()
        .padding()
}
