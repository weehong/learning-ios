import SwiftUI

extension Color {
    static let appTheme = Color.AppTheme()
    
    struct AppTheme {
        let primaryColor: Color = Color("PrimaryColor")
        let borderColor: Color = Color("BorderColor")
    }
}
