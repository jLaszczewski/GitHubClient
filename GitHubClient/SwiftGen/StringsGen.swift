// Generated using SwiftGen, by O.Halligon — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// swiftlint:disable identifier_name line_length type_body_length
internal enum L10n {
  /// GitHub Client
  internal static let locListViewTitle = L10n.tr("Localizable", "loc_list_view_title")
}
// swiftlint:enable identifier_name line_length type_body_length

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = NSLocalizedString(key, tableName: table, bundle: Bundle(for: BundleToken.self), comment: "")
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

private final class BundleToken {}
