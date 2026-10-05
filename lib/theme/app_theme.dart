import 'package:flutter/material.dart';

class AppTheme {
  // ============================================================
  // COLORS
  // ============================================================

  static const Color primaryColor =
      Color(0xFF2474F5);

  static const Color secondaryColor =
      Color(0xFF25B88A);

  static const Color backgroundColor =
      Color(0xFFF7F9FC);

  static const Color darkTextColor =
      Color(0xFF172B4D);

  static const Color lightBorderColor =
      Color(0xFFE8ECF1);

  static const Color warningColor =
      Color(0xFFFFA726);

  // ============================================================
  // LIGHT THEME
  // ============================================================

  static ThemeData lightTheme =
      ThemeData(
    useMaterial3: true,

    brightness: Brightness.light,

    colorScheme: ColorScheme.fromSeed(
      seedColor: primaryColor,
      brightness: Brightness.light,
    ),

    scaffoldBackgroundColor:
        backgroundColor,

    fontFamily: 'Roboto',

    // ========================================================
    // APP BAR
    // ========================================================

    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: false,

      iconTheme: IconThemeData(
        color: darkTextColor,
      ),

      titleTextStyle: TextStyle(
        color: darkTextColor,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    ),

    // ========================================================
    // ELEVATED BUTTON
    // ========================================================

    elevatedButtonTheme:
        ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,

        elevation: 0,

        minimumSize:
            const Size(double.infinity, 54),

        shape:
            RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(16),
        ),

        textStyle: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),

    // ========================================================
    // OUTLINED BUTTON
    // ========================================================

    outlinedButtonTheme:
        OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: primaryColor,

        minimumSize:
            const Size(double.infinity, 54),

        side: const BorderSide(
          color: primaryColor,
          width: 1.5,
        ),

        shape:
            RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(16),
        ),

        textStyle: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),

    // ========================================================
    // TEXT BUTTON
    // ========================================================

    textButtonTheme:
        TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: primaryColor,

        textStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),

    // ========================================================
    // INPUT FIELD
    // ========================================================

    inputDecorationTheme:
        InputDecorationTheme(
      filled: true,

      fillColor: Colors.white,

      contentPadding:
          const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 15,
      ),

      hintStyle: const TextStyle(
        color: Colors.grey,
        fontSize: 12,
      ),

      labelStyle: const TextStyle(
        color: darkTextColor,
        fontSize: 12,
      ),

      border: OutlineInputBorder(
        borderRadius:
            BorderRadius.circular(16),

        borderSide: BorderSide.none,
      ),

      enabledBorder:
          OutlineInputBorder(
        borderRadius:
            BorderRadius.circular(16),

        borderSide: const BorderSide(
          color: lightBorderColor,
        ),
      ),

      focusedBorder:
          OutlineInputBorder(
        borderRadius:
            BorderRadius.circular(16),

        borderSide: const BorderSide(
          color: primaryColor,
          width: 1.5,
        ),
      ),

      errorBorder:
          OutlineInputBorder(
        borderRadius:
            BorderRadius.circular(16),

        borderSide: const BorderSide(
          color: Colors.red,
        ),
      ),

      focusedErrorBorder:
          OutlineInputBorder(
        borderRadius:
            BorderRadius.circular(16),

        borderSide: const BorderSide(
          color: Colors.red,
          width: 1.5,
        ),
      ),
    ),

    // ========================================================
    // CARD
    // ========================================================

    cardTheme: CardThemeData(
      color: Colors.white,

      elevation: 0,

      margin: EdgeInsets.zero,

      shape:
          RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(18),

        side: const BorderSide(
          color: lightBorderColor,
        ),
      ),
    ),

    // ========================================================
    // DIVIDER
    // ========================================================

    dividerTheme:
        const DividerThemeData(
      color: lightBorderColor,
      thickness: 1,
      space: 1,
    ),

    // ========================================================
    // SNACKBAR
    // ========================================================

    snackBarTheme:
        SnackBarThemeData(
      backgroundColor:
          darkTextColor,

      contentTextStyle:
          const TextStyle(
        color: Colors.white,
        fontSize: 12,
      ),

      behavior:
          SnackBarBehavior.floating,

      shape:
          RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(12),
      ),
    ),

    // ========================================================
    // PROGRESS INDICATOR
    // ========================================================

    progressIndicatorTheme:
        const ProgressIndicatorThemeData(
      color: primaryColor,
    ),

    // ========================================================
    // ICON
    // ========================================================

    iconTheme:
        const IconThemeData(
      color: darkTextColor,
    ),
  );
}