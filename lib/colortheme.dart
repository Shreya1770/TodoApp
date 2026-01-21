import 'package:flutter/material.dart';

class MyTheme {

  // ---------------- LIGHT THEME ----------------
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,

    scaffoldBackgroundColor: const Color(0xFFEFF6FF),

    colorScheme: const ColorScheme.light(
      primary: Color(0xFF4A86E8),         
      secondary: Color(0xFFF47C3C),       
      background: Color(0xFFEFF6FF),
      surface: Colors.white,
      surfaceVariant: Color(0xFFE3EDFF),   

      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onBackground: Color(0xFF1C1C1C),
      onSurface: Color(0xFF1C1C1C),
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor:  Color(0xFF4A86E8),
      foregroundColor: Colors.white,
      centerTitle: true,
      elevation: 0,
    ),

    // cardTheme: CardTheme(
    //   color: Colors.white,
    //   elevation: 4,
    //   shape: RoundedRectangleBorder(
    //     borderRadius: BorderRadius.circular(20),
    //   ),
    // ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFF4A86E8),
        foregroundColor: Colors.white,
        minimumSize: const Size(double.infinity, 56),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),

    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: Color(0xFF1C1C1C),
      ),
      titleMedium: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: Color(0xFF1C1C1C),
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        color: Color(0xFF6B7280),
      ),
    ),
  );

  // ---------------- DARK THEME ----------------
  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,

    scaffoldBackgroundColor: const Color(0xFF0F172A),

    colorScheme: const ColorScheme.dark(
      primary: Color(0xFF60A5FA),          // Soft blue
      secondary: Color(0xFFF59E0B),        // Accent orange
      background: Color(0xFF0F172A),
      surface: Color(0xFF1E293B),
      surfaceVariant: Color(0xFF334155),

      onPrimary: Colors.black,
      onSecondary: Colors.black,
      onBackground: Color(0xFFF8FAFC),
      onSurface: Color(0xFFF8FAFC),
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF1E293B),
      foregroundColor: Colors.white,
      centerTitle: true,
      elevation: 0,
    ),

    // cardTheme: CardTheme(
    //   color: const Color(0xFF1E293B),
    //   elevation: 2,
    //   shape: RoundedRectangleBorder(
    //     borderRadius: BorderRadius.circular(20),
    //   ),
    // ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFFF59E0B),
        foregroundColor: Colors.black,
        minimumSize: const Size(double.infinity, 56),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),

    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: Color(0xFFF8FAFC),
      ),
      titleMedium: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: Color(0xFFF8FAFC),
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        color: Color(0xFF94A3B8),
      ),
    ),
  );
}
