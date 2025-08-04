import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home.dart';

void main() => runApp(const RestApiDemo());

class RestApiDemo extends StatelessWidget {
  const RestApiDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF0A0A0F),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF0A0A0F),
          titleTextStyle: TextStyle(
            fontSize: 24,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          iconTheme: IconThemeData(color: Colors.white),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color(0xFF6A4C93),
          foregroundColor: Colors.white,
          elevation: 8,
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white, fontSize: 16),
          bodyMedium: TextStyle(color: Colors.white, fontSize: 14),
          titleLarge: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
          titleMedium: TextStyle(color: Colors.white70, fontSize: 16),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: const Color(0xFF1A1A2E),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Color(0xFF6A4C93)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Color(0xFF6A4C93), width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Color(0xFF9A7FB8), width: 2),
          ),
          labelStyle: const TextStyle(color: Colors.white70),
          hintStyle: const TextStyle(color: Colors.white54),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF6A4C93),
            foregroundColor: Colors.white,
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: const Color(0xFF9A7FB8),
          ),
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6A4C93),
          brightness: Brightness.dark,
          background: const Color(0xFF0A0A0F),
          surface: const Color(0xFF1A1A2E),
          primary: const Color(0xFF6A4C93),
          secondary: const Color(0xFF9A7FB8),
        ),
      ),
      home: Home(),
    );
  }
}