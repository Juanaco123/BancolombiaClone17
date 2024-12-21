// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
public enum L10n {
  public enum Events {
    /// ABOUT
    public static let about = L10n.tr("Localizable", "events.about", fallback: "ABOUT")
    /// Explore
    public static let explore = L10n.tr("Localizable", "events.explore", fallback: "Explore")
    /// %d GOING
    public static func going(_ p1: Int) -> String {
      return L10n.tr("Localizable", "events.going", p1, fallback: "%d GOING")
    }
    /// Worldwide
    public static let locationTitle = L10n.tr("Localizable", "events.locationTitle", fallback: "Worldwide")
    /// I’m no longer interested
    public static let noLongerInterested = L10n.tr("Localizable", "events.noLongerInterested", fallback: "I’m no longer interested")
    /// %d events
    public static func numOfEvents(_ p1: Int) -> String {
      return L10n.tr("Localizable", "events.numOfEvents", p1, fallback: "%d events")
    }
    /// RSVP
    public static let rsvp = L10n.tr("Localizable", "events.rsvp", fallback: "RSVP")
    /// See on web
    public static let seeOnWeb = L10n.tr("Localizable", "events.seeOnWeb", fallback: "See on web")
    /// Localizable.strings
    ///   Events
    ///
    ///   Created by Miguel Angel De Leon Palacios on 29/11/24.
    public static let segmentEventTitle = L10n.tr("Localizable", "events.segmentEventTitle", fallback: "EVENTS")
    /// UPCOMING
    public static let segmentUpcomingTitle = L10n.tr("Localizable", "events.segmentUpcomingTitle", fallback: "UPCOMING")
    /// Select a city
    public static let selectCity = L10n.tr("Localizable", "events.selectCity", fallback: "Select a city")
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

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
