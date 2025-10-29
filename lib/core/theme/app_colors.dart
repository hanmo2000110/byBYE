import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFFE8A598);
  static const Color primaryContainer = Color(0xFFF5D5CE);
  static const Color secondary = Color(0xFFB8A99A);
  static const Color secondaryContainer = Color(0xFFE5D7C9);
  static const Color tertiary = Color(0xFF9BB8A8);
  static const Color tertiaryContainer = Color(0xFFD1E8D7);

  static const Color surface = Color(0xFFFFF8F7);
  static const Color surfaceContainer = Color(0xFFF7F0EF);
  static const Color surfaceContainerHigh = Color(0xFFF1EAE9);
  static const Color surfaceContainerHighest = Color(0xFFEBE4E3);

  static const Color onPrimary = Color(0xFFFFFFFF);
  static const Color onPrimaryContainer = Color(0xFF3A1F1A);
  static const Color onSecondary = Color(0xFFFFFFFF);
  static const Color onSecondaryContainer = Color(0xFF2B231B);
  static const Color onTertiary = Color(0xFFFFFFFF);
  static const Color onTertiaryContainer = Color(0xFF1A2B20);

  static const Color onSurface = Color(0xFF201A19);
  static const Color onSurfaceVariant = Color(0xFF534341);

  static const Color outline = Color(0xFF857370);
  static const Color outlineVariant = Color(0xFFD7C3C0);

  static const Color error = Color(0xFFBA1A1A);
  static const Color errorContainer = Color(0xFFFFDAD6);
  static const Color onError = Color(0xFFFFFFFF);
  static const Color onErrorContainer = Color(0xFF410002);

  static const Color shadow = Color(0xFF000000);
  static const Color scrim = Color(0xFF000000);

  static const ColorScheme lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: primary,
    onPrimary: onPrimary,
    primaryContainer: primaryContainer,
    onPrimaryContainer: onPrimaryContainer,
    secondary: secondary,
    onSecondary: onSecondary,
    secondaryContainer: secondaryContainer,
    onSecondaryContainer: onSecondaryContainer,
    tertiary: tertiary,
    onTertiary: onTertiary,
    tertiaryContainer: tertiaryContainer,
    onTertiaryContainer: onTertiaryContainer,
    error: error,
    onError: onError,
    errorContainer: errorContainer,
    onErrorContainer: onErrorContainer,
    surface: surface,
    onSurface: onSurface,
    onSurfaceVariant: onSurfaceVariant,
    outline: outline,
    outlineVariant: outlineVariant,
    shadow: shadow,
    scrim: scrim,
    surfaceContainerHighest: surfaceContainerHighest,
  );

  static const Color primaryDark = Color(0xFFD0A996);
  static const Color primaryContainerDark = Color(0xFF5A3A30);
  static const Color secondaryDark = Color(0xFFCDB8A9);
  static const Color secondaryContainerDark = Color(0xFF453B2D);
  static const Color tertiaryDark = Color(0xFFB5CCB7);
  static const Color tertiaryContainerDark = Color(0xFF3A4B3F);

  static const Color surfaceDark = Color(0xFF181211);
  static const Color surfaceContainerDark = Color(0xFF251E1D);
  static const Color surfaceContainerHighDark = Color(0xFF302928);
  static const Color surfaceContainerHighestDark = Color(0xFF3C3432);

  static const Color onPrimaryDark = Color(0xFF3A1F1A);
  static const Color onPrimaryContainerDark = Color(0xFFF2C3B0);
  static const Color onSecondaryDark = Color(0xFF2B231B);
  static const Color onSecondaryContainerDark = Color(0xFFE9D2C4);
  static const Color onTertiaryDark = Color(0xFF1A2B20);
  static const Color onTertiaryContainerDark = Color(0xFFD1E8D7);

  static const Color onSurfaceDark = Color(0xFFEBE0DE);
  static const Color onSurfaceVariantDark = Color(0xFFD7C3C0);

  static const Color outlineDark = Color(0xFFA08D8A);
  static const Color outlineVariantDark = Color(0xFF534341);

  static const ColorScheme darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: primaryDark,
    onPrimary: onPrimaryDark,
    primaryContainer: primaryContainerDark,
    onPrimaryContainer: onPrimaryContainerDark,
    secondary: secondaryDark,
    onSecondary: onSecondaryDark,
    secondaryContainer: secondaryContainerDark,
    onSecondaryContainer: onSecondaryContainerDark,
    tertiary: tertiaryDark,
    onTertiary: onTertiaryDark,
    tertiaryContainer: tertiaryContainerDark,
    onTertiaryContainer: onTertiaryContainerDark,
    error: error,
    onError: onError,
    errorContainer: errorContainer,
    onErrorContainer: onErrorContainer,
    surface: surfaceDark,
    onSurface: onSurfaceDark,
    onSurfaceVariant: onSurfaceVariantDark,
    outline: outlineDark,
    outlineVariant: outlineVariantDark,
    shadow: shadow,
    scrim: scrim,
    surfaceContainerHighest: surfaceContainerHighestDark,
  );
}