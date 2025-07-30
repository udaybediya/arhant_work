import 'package:arhant/screens/Attendancepage.dart';
import 'package:arhant/screens/Loginpage.dart';
import 'package:arhant/screens/ProfilePage.dart';
import 'package:arhant/screens/Stockspage.dart';
import 'package:arhant/screens/Vendorspage.dart';
import 'package:arhant/screens/editprofilepage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Arhant Assignment',
      debugShowCheckedModeBanner: false,
      home: const Loginpage(),
      routes: {
        '/login': (context) => const Loginpage(),
        '/stocks': (context) => const Stockspage(),
        '/vendors': (context) => const Vendorspage(),
        '/attendance': (context) => const Attendancepage(),
        '/profile': (context) => const Profilepage(),
      },
    );
  }
}
