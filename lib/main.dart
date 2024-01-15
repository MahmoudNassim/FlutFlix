import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moviesapp/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
      ),
      themeMode: ThemeMode.dark,
      home: HomeScreen(),
    );
  }
}
