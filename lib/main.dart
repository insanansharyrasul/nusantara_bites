import 'package:flutter/material.dart';
import 'main_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MaterialApp(
        title: "Nusantara-Bites!",
        theme: ThemeData(
          brightness: Brightness.dark,
        ),
        home: const MainResponsive(),
      ),
    );
  }
}
