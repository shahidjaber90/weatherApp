import 'package:flutter/material.dart';
import 'package:weatherapp/Screens/favorite_page.dart';
import 'package:weatherapp/Screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const FavoritePage(),
    );
  }
}