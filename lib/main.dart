import 'package:flutter/material.dart';
import 'package:unjuk_keterampilan_fg/pages/bottom_nav_page.dart';
import 'package:unjuk_keterampilan_fg/resources/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          foregroundColor: ColorPalette().mainBlackColor,
        ),
      ),
      home: const MainApp(),
    );
  }
}
