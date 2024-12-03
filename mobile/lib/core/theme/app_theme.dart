import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

class AppTheme {
  // Primary Colors
  static const sageGreen = Color(0xFF68946A); // Frisch, natürlich, beruhigend
  static const terracotta =
      Color(0xFFE07A5F); // Warm, einladend, appetitanregend

  // Supporting Colors
  static const creamyBeige = Color(0xFFF2CC8F); // Warm, einladend
  static const deepBrown = Color(0xFF81523F); // Erdverbunden, rustikal
  static const freshMint = Color(0xFF3D5A6C); // Frisch, modern

  static ThemeData get light => FlexThemeData.light(
        colors: FlexSchemeColor(
          primary: sageGreen,
          primaryContainer: sageGreen.withOpacity(0.8),
          secondary: terracotta,
          secondaryContainer: terracotta.withOpacity(0.8),
          tertiary: creamyBeige,
          tertiaryContainer: deepBrown,
          error: terracotta.withRed(255),
        ),
        surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
        blendLevel: 7,
        subThemesData: const FlexSubThemesData(
          blendOnLevel: 10,
          blendOnColors: false,
          useTextTheme: true,
          useM2StyleDividerInM3: true,
          alignedDropdown: true,
          useInputDecoratorThemeInDialogs: true,
          thinBorderWidth: 1.5,
          thickBorderWidth: 2.5,
          textButtonRadius: 12,
          elevatedButtonRadius: 12,
          outlinedButtonRadius: 12,
          toggleButtonsRadius: 12,
          cardRadius: 16,
          popupMenuRadius: 12,
          dialogRadius: 20,
          bottomSheetRadius: 20,
        ),
        keyColors: const FlexKeyColors(
          useSecondary: true,
          useTertiary: true,
        ),
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        useMaterial3: true,
      );

  static ThemeData get dark => FlexThemeData.dark(
        colors: FlexSchemeColor(
          primary: sageGreen.withOpacity(0.9),
          primaryContainer: sageGreen.withOpacity(0.7),
          secondary: terracotta.withOpacity(0.9),
          secondaryContainer: terracotta.withOpacity(0.7),
          tertiary: creamyBeige.withOpacity(0.9),
          tertiaryContainer: deepBrown.withOpacity(0.7),
          error: terracotta.withRed(255),
        ),
        surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
        blendLevel: 13,
        subThemesData: const FlexSubThemesData(
          blendOnLevel: 20,
          useTextTheme: true,
          useM2StyleDividerInM3: true,
          alignedDropdown: true,
          useInputDecoratorThemeInDialogs: true,
          thinBorderWidth: 1.5,
          thickBorderWidth: 2.5,
          textButtonRadius: 12,
          elevatedButtonRadius: 12,
          outlinedButtonRadius: 12,
          toggleButtonsRadius: 12,
          cardRadius: 16,
          popupMenuRadius: 12,
          dialogRadius: 20,
          bottomSheetRadius: 20,
        ),
        keyColors: const FlexKeyColors(
          useSecondary: true,
          useTertiary: true,
        ),
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        useMaterial3: true,
      );
}
