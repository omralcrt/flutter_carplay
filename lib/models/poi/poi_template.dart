import 'package:uuid/uuid.dart';
import 'poi.dart';

/// A template object that displays point of interest.
class CPPointOfInterestTemplate {
  /// Unique id of the object.
  final String _elementId = const Uuid().v4();

  /// A title will be shown in the navigation bar.
  final String title;
  final List<CPPointOfInterest> poi;

  /// An indicator you use to call attention to the tab. When it is true, a small
  /// red indicator will be displayed on the tab in order to show user that it requires
  /// an action or you received an notification e.g.
  ///
  /// CarPlay only displays the red indicator when the template is a root-template
  /// of a tab bar, otherwise setting this property has no effect.
  final bool showsTabBadge;

  /// A system icon which will be used in a image that represents the content of the tab.
  ///
  /// SF Symbols provides a set of over 3,100 consistent, highly configurable symbols you can
  /// use in your app. Apple designed SF Symbols to integrate seamlessly with the San Francisco
  /// system font, so the symbols automatically align with text in all weights and sizes.
  ///
  /// **See**:
  /// - [SF Symbols Apple Website](https://developer.apple.com/sf-symbols/)
  /// - [SF Symbols - Human Interface Guidelines](https://developer.apple.com/design/human-interface-guidelines/sf-symbols/overview/)
  ///
  /// **IMPORTANT:**
  /// All SF Symbols shall be considered to be system-provided images as defined in the Xcode and Apple SDKs
  /// license agreements and are subject to the terms and conditions set forth therein. You may not use SF
  /// Symbols—or glyphs that are substantially or confusingly similar—in your app icons, logos, or any other
  /// trademark-related use. Apple reserves the right to review and, in its sole discretion, require modification
  /// or discontinuance of use of any Symbol used in violation of the foregoing restrictions, and you agree to
  /// promptly comply with any such request.
  final String systemIcon;

  /// Creates [CPPointOfInterestTemplate]
  CPPointOfInterestTemplate({
    required this.title,
    required this.poi,
    this.showsTabBadge = false,
    required this.systemIcon,
  });

  Map<String, dynamic> toJson() => {
    "_elementId": _elementId,
    "title": title,
    "poi": poi.map((e) => e.toJson()).toList(),
    "showsTabBadge": showsTabBadge,
    "systemIcon": systemIcon,
  };

  String get uniqueId {
    return _elementId;
  }
}
