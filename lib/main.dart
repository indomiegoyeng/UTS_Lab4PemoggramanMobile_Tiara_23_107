import 'package:flutter/material.dart';
import '../screens/LoginScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz Lab 4',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        fontFamily: 'FamilijenGrostesk'
      ),
      home: const LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}