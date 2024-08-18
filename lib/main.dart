import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:one_context/one_context.dart';
import 'package:phtv_admin/screens/auth/login_screen.dart';
import 'package:phtv_admin/screens/tabs_screen.dart';


final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.indigoAccent,
  ),
  fontFamily: GoogleFonts.inter().fontFamily,
  textTheme: GoogleFonts.interTextTheme(),
);

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      builder: OneContext().builder,
      navigatorKey: OneContext().key,
      home: const LoginScreen(),
    );
  }
}