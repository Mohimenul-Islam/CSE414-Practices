import 'package:flutter/material.dart';

// Entry point of my application
void main() {
  runApp(const MyApp());
}

// Root widget of my application
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Removing debug banner for cleaner UI
      title: 'Hello World App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
      ),
      home: const HelloWorldPage(),
    );
  }
}

// Main page that displays the Hello World text
class HelloWorldPage extends StatelessWidget {
  const HelloWorldPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text(
          'Hello World!',
          style: TextStyle(
            fontFamily: 'Pacifico', // Using my custom font
            fontSize: 40.0,
            color: Colors.teal, // Teal color for better aesthetics
            fontWeight: FontWeight.bold,
            letterSpacing: 2.0,
            shadows: [
              // Adding shadow effect for depth
              Shadow(
                blurRadius: 5.0,
                color: Colors.teal.shade200,
                offset: const Offset(2.0, 2.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
