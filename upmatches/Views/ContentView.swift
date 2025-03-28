import SwiftUI

struct ContentView: View {
    // A state variable to control the navigation
    @State private var isNavigationActive = false
    
    var body: some View {
        NavigationStack {
            VStack {
                VStack {
                    Text("Upmatches")
                        .font(FontFamily.HafferTRIAL.bold.swiftUIFont(size: 32))
                    Text("Meet & play with like-minded sports people like you")
                        .font(.title3)
                        .multilineTextAlignment(.center)
                        .padding(.top, 4)
                }
                .frame(maxHeight: .infinity)
                
                Spacer()
                
                Button(action: {
                    isNavigationActive = true
                }) {
                    Text("Login")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.appTheme.primaryColor)
                        .cornerRadius(25)
                        .textCase(.uppercase)
                }
                .padding(.bottom, 32)
                .navigationDestination(isPresented: $isNavigationActive) {
                    NextPageView()
                }
            }
            .frame(maxWidth: .infinity)
            .padding()
        }
    }
}

struct NextPageView: View {
    var body: some View {
        VStack {
            Text("Next Page")
                .font(.largeTitle)
            Text("This is the next screen.")
                .font(.title3)
        }
        .navigationBarTitle("Next Page", displayMode: .inline)
    }
}

#Preview {
    ContentView()
}
