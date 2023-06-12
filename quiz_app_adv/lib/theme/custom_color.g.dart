//import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';

const extra = Color(0xFF008654);

CustomColors lightCustomColors = const CustomColors(
  sourceExtra: Color(0xFF008654),
  extra: Color(0xFF006D43),
  onExtra: Color(0xFFFFFFFF),
  extraContainer: Color(0xFF8DF8BB),
  onExtraContainer: Color(0xFF002111),
);

CustomColors darkCustomColors = const CustomColors(
  sourceExtra: Color(0xFF008654),
  extra: Color(0xFF71DBA1),
  onExtra: Color(0xFF003921),
  extraContainer: Color(0xFF005231),
  onExtraContainer: Color(0xFF8DF8BB),
);

/// Defines a set of custom colors, each comprised of 4 complementary tones.
///
/// See also:
///   * <https://m3.material.io/styles/color/the-color-system/custom-colors>
@immutable
class CustomColors extends ThemeExtension<CustomColors> {
  const CustomColors({
    required this.sourceExtra,
    required this.extra,
    required this.onExtra,
    required this.extraContainer,
    required this.onExtraContainer,
  });

  final Color? sourceExtra;
  final Color? extra;
  final Color? onExtra;
  final Color? extraContainer;
  final Color? onExtraContainer;

  @override
  CustomColors copyWith({
    Color? sourceExtra,
    Color? extra,
    Color? onExtra,
    Color? extraContainer,
    Color? onExtraContainer,
  }) {
    return CustomColors(
      sourceExtra: sourceExtra ?? this.sourceExtra,
      extra: extra ?? this.extra,
      onExtra: onExtra ?? this.onExtra,
      extraContainer: extraContainer ?? this.extraContainer,
      onExtraContainer: onExtraContainer ?? this.onExtraContainer,
    );
  }

  @override
  CustomColors lerp(ThemeExtension<CustomColors>? other, double t) {
    if (other is! CustomColors) {
      return this;
    }
    return CustomColors(
      sourceExtra: Color.lerp(sourceExtra, other.sourceExtra, t),
      extra: Color.lerp(extra, other.extra, t),
      onExtra: Color.lerp(onExtra, other.onExtra, t),
      extraContainer: Color.lerp(extraContainer, other.extraContainer, t),
      onExtraContainer: Color.lerp(onExtraContainer, other.onExtraContainer, t),
    );
  }

  /// Returns an instance of [CustomColors] in which the following custom
  /// colors are harmonized with [dynamic]'s [ColorScheme.primary].
  ///
  /// See also:
  ///   * <https://m3.material.io/styles/color/the-color-system/custom-colors#harmonization>
  CustomColors harmonized(ColorScheme dynamic) {
    return copyWith();
  }
}
