import 'package:flutter/material.dart';

import 'screens/landing_screen.dart';

void main() {
  runApp(const MojekApp());
}

class MojekApp extends StatelessWidget {
  const MojekApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MOJEK',

      theme: ThemeData(
        useMaterial3: true,

        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF2474F5),
          brightness: Brightness.light,
        ),

        scaffoldBackgroundColor:
            const Color(0xFFF7F9FC),

        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: false,
        ),

        inputDecorationTheme:
            InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,

          border: OutlineInputBorder(
            borderRadius:
                BorderRadius.all(
              Radius.circular(16),
            ),
            borderSide: BorderSide.none,
          ),

          enabledBorder:
              OutlineInputBorder(
            borderRadius:
                BorderRadius.all(
              Radius.circular(16),
            ),
            borderSide: BorderSide(
              color: Color(0xFFE8ECF1),
            ),
          ),

          focusedBorder:
              OutlineInputBorder(
            borderRadius:
                BorderRadius.all(
              Radius.circular(16),
            ),
            borderSide: BorderSide(
              color: Color(0xFF2474F5),
              width: 1.5,
            ),
          ),

          contentPadding:
              EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 15,
          ),
        ),

        elevatedButtonTheme:
            ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor:
                const Color(0xFF2474F5),
            foregroundColor: Colors.white,

            elevation: 0,

            shape:
                RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(16),
            ),
          ),
        ),

        textButtonTheme:
            TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor:
                const Color(0xFF2474F5),
          ),
        ),
      ),

      home: const LandingScreen(),
    );
  }
}