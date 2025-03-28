// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

#if os(macOS)
  import AppKit.NSFont
#elseif os(iOS) || os(tvOS) || os(watchOS)
  import UIKit.UIFont
#endif
#if canImport(SwiftUI)
  import SwiftUI
#endif

// Deprecated typealiases
@available(*, deprecated, renamed: "FontConvertible.Font", message: "This typealias will be removed in SwiftGen 7.0")
public typealias Font = FontConvertible.Font

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Fonts

// swiftlint:disable identifier_name line_length type_body_length
public enum FontFamily {
  public enum HafferTRIAL {
    public static let black = FontConvertible(name: "Haffer-Black-TRIAL", family: "Haffer-TRIAL", path: "Haffer-TRIAL-Black.ttf")
    public static let blackItalic = FontConvertible(name: "Haffer-BlackItalic-TRIAL", family: "Haffer-TRIAL", path: "Haffer-TRIAL-BlackItalic.ttf")
    public static let bold = FontConvertible(name: "Haffer-Bold-TRIAL", family: "Haffer-TRIAL", path: "Haffer-TRIAL-Bold.ttf")
    public static let boldItalic = FontConvertible(name: "Haffer-BoldItalic-TRIAL", family: "Haffer-TRIAL", path: "Haffer-TRIAL-BoldItalic.ttf")
    public static let heavy = FontConvertible(name: "Haffer-Heavy-TRIAL", family: "Haffer-TRIAL", path: "Haffer-TRIAL-Heavy.ttf")
    public static let heavyItalic = FontConvertible(name: "Haffer-HeavyItalic-TRIAL", family: "Haffer-TRIAL", path: "Haffer-TRIAL-HeavyItalic.ttf")
    public static let light = FontConvertible(name: "Haffer-Light-TRIAL", family: "Haffer-TRIAL", path: "Haffer-TRIAL-Light.ttf")
    public static let lightItalic = FontConvertible(name: "Haffer-LightItalic-TRIAL", family: "Haffer-TRIAL", path: "Haffer-TRIAL-LightItalic.ttf")
    public static let medium = FontConvertible(name: "Haffer-Medium-TRIAL", family: "Haffer-TRIAL", path: "Haffer-TRIAL-Medium.ttf")
    public static let mediumItalic = FontConvertible(name: "Haffer-MediumItalic-TRIAL", family: "Haffer-TRIAL", path: "Haffer-TRIAL-MediumItalic.ttf")
    public static let regular = FontConvertible(name: "Haffer-Regular-TRIAL", family: "Haffer-TRIAL", path: "Haffer-TRIAL-Regular.ttf")
    public static let regularItalic = FontConvertible(name: "Haffer-RegularItalic-TRIAL", family: "Haffer-TRIAL", path: "Haffer-TRIAL-RegularItalic.ttf")
    public static let semiBold = FontConvertible(name: "Haffer-SemiBold-TRIAL", family: "Haffer-TRIAL", path: "Haffer-TRIAL-SemiBold.ttf")
    public static let semiBoldItalic = FontConvertible(name: "Haffer-SemiBoldItalic-TRIAL", family: "Haffer-TRIAL", path: "Haffer-TRIAL-SemiBoldItalic.ttf")
    public static let thin = FontConvertible(name: "Haffer-Thin-TRIAL", family: "Haffer-TRIAL", path: "Haffer-TRIAL-Thin.ttf")
    public static let thinItalic = FontConvertible(name: "Haffer-ThinItalic-TRIAL", family: "Haffer-TRIAL", path: "Haffer-TRIAL-ThinItalic.ttf")
    public static let all: [FontConvertible] = [black, blackItalic, bold, boldItalic, heavy, heavyItalic, light, lightItalic, medium, mediumItalic, regular, regularItalic, semiBold, semiBoldItalic, thin, thinItalic]
  }
  public static let allCustomFonts: [FontConvertible] = [HafferTRIAL.all].flatMap { $0 }
  public static func registerAllCustomFonts() {
    allCustomFonts.forEach { $0.register() }
  }
}
// swiftlint:enable identifier_name line_length type_body_length

// MARK: - Implementation Details

public struct FontConvertible {
  public let name: String
  public let family: String
  public let path: String

  #if os(macOS)
  public typealias Font = NSFont
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  public typealias Font = UIFont
  #endif

  public func font(size: CGFloat) -> Font {
    guard let font = Font(font: self, size: size) else {
      fatalError("Unable to initialize font '\(name)' (\(family))")
    }
    return font
  }

  #if canImport(SwiftUI)
  @available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
  public func swiftUIFont(size: CGFloat) -> SwiftUI.Font {
    return SwiftUI.Font.custom(self, size: size)
  }

  @available(iOS 14.0, tvOS 14.0, watchOS 7.0, macOS 11.0, *)
  public func swiftUIFont(fixedSize: CGFloat) -> SwiftUI.Font {
    return SwiftUI.Font.custom(self, fixedSize: fixedSize)
  }

  @available(iOS 14.0, tvOS 14.0, watchOS 7.0, macOS 11.0, *)
  public func swiftUIFont(size: CGFloat, relativeTo textStyle: SwiftUI.Font.TextStyle) -> SwiftUI.Font {
    return SwiftUI.Font.custom(self, size: size, relativeTo: textStyle)
  }
  #endif

  public func register() {
    // swiftlint:disable:next conditional_returns_on_newline
    guard let url = url else { return }
    CTFontManagerRegisterFontsForURL(url as CFURL, .process, nil)
  }

  fileprivate func registerIfNeeded() {
    #if os(iOS) || os(tvOS) || os(watchOS)
    if !UIFont.fontNames(forFamilyName: family).contains(name) {
      register()
    }
    #elseif os(macOS)
    if let url = url, CTFontManagerGetScopeForURL(url as CFURL) == .none {
      register()
    }
    #endif
  }

  fileprivate var url: URL? {
    // swiftlint:disable:next implicit_return
    return BundleToken.bundle.url(forResource: path, withExtension: nil)
  }
}

public extension FontConvertible.Font {
  convenience init?(font: FontConvertible, size: CGFloat) {
    font.registerIfNeeded()
    self.init(name: font.name, size: size)
  }
}

#if canImport(SwiftUI)
@available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
public extension SwiftUI.Font {
  static func custom(_ font: FontConvertible, size: CGFloat) -> SwiftUI.Font {
    font.registerIfNeeded()
    return custom(font.name, size: size)
  }
}

@available(iOS 14.0, tvOS 14.0, watchOS 7.0, macOS 11.0, *)
public extension SwiftUI.Font {
  static func custom(_ font: FontConvertible, fixedSize: CGFloat) -> SwiftUI.Font {
    font.registerIfNeeded()
    return custom(font.name, fixedSize: fixedSize)
  }

  static func custom(
    _ font: FontConvertible,
    size: CGFloat,
    relativeTo textStyle: SwiftUI.Font.TextStyle
  ) -> SwiftUI.Font {
    font.registerIfNeeded()
    return custom(font.name, size: size, relativeTo: textStyle)
  }
}
#endif

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
