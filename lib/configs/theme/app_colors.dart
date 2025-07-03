import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryColor = Color(
    0xFF512DA8,
  ); // Primary dark background (#1a1a1a)
  // Background Colors
  static const Color darkBackground = Color(
    0xFF1A1A1A,
  ); // Primary dark background (#1a1a1a)
  static const Color darkerBackground = Color(
    0xFF141414,
  ); // Used in Appointments screen
  static const Color cardBackground = Color(
    0xFF363636,
  ); // Card/input field background (#363636)
  static const Color buttonBackground = Color(0xFF000000); // Black buttons

  // Text Colors
  static const Color primaryText = Color(0xFFFFFFFF); // White text (#ffffff)
  static const Color secondaryText = Color(
    0xFFADADAD,
  ); // Gray text (#adadad) for less important info
  static const Color grayText = Color(
    0xFFABABAB,
  ); // Gray text (#adadad) for less important info
  static const Color accentText = Color(
    0xFF2096F3,
  ); // Blue accent text (matches your existing)

  // UI Elements
  static const Color primaryAccent = Color(
    0xFF42960F,
  ); // Your existing main green
  static const Color secondaryAccent = Color(
    0xFFFF7A00,
  ); // Your existing orange
  static const Color iconColor = Color(0xFFFFFFFF); // White icons
  static const Color dividerColor = Color(
    0xFF303030,
  ); // Divider/dark elements (#303030)
  static const Color darkColor = Color(
    0xFF212121,
  ); // Divider/dark elements (#303030)

  // States
  static const Color success = Color(0xFF4CAF50); // Green for success states
  static const Color warning = Color(0xFFFFC107); // Yellow for warnings
  static const Color error = Color(0xFFF44336); // Red for errors
  static const Color disabled = Color(0xFF666666); // Disabled state

  // Transparent
  static const Color transparent = Colors.transparent;

  // Additional accent colors from your design
  static const Color blueAccent = Color(
    0xFF2096F3,
  ); // Blue accent from your existing

  // Text variants
  static const Color text1 = Color(
    0xFF333333,
  ); // Your existing, though not used in dark theme
  static const Color text2 = Color(0xFF666666); // Your existing

  // White (kept from your existing)
  static const Color white = Color(0xFFFFFFFF);

  // Optional: Add a method to create a MaterialColor from a single Color
  MaterialColor createMaterialColor(Color color) {
    List strengths = <double>[.05];
    final swatch = <int, Color>{};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }

    for (var strength in strengths) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }

    return MaterialColor(color.value, swatch);
  }
}
