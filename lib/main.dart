import 'package:flutter/material.dart';
import 'package:unjuk_keterampilan_fg/pages/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          foregroundColor: Colors.black,
        ),
      ),
      home: const MainApp(),
    );
  }
}
