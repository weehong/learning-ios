import SwiftUI

extension Color {
  static let appTheme = AppTheme()

  struct AppTheme {
    let appColor: Color = Color("AppColor", bundle: .main)
    let borderColor: Color = Color("BorderColor", bundle: .main)
  }
}
