import 'package:flutter/material.dart';
import 'package:news_app_ui_setup/Views/Home_view.dart';

void main() {
  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.light().copyWith(
            scaffoldBackgroundColor: const Color(0xfff263353),
            appBarTheme: AppBarTheme(backgroundColor: Color(0xfff263353))),
        debugShowCheckedModeBanner: false,
        home: const HomeView());
  }
}
