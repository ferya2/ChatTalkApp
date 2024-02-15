import 'package:chat_talk_app/view/start/login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static bool isDarkMode = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: ThemeData.light().copyWith(
          // Atur properti tema light di sini
          ),
      darkTheme: ThemeData.dark(),
      home: LoginPage(),
    );
  }
}
