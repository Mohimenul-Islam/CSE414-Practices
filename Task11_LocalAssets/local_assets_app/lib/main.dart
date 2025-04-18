import 'package:flutter/material.dart';

// Main function where my app starts
void main() {
  runApp(const MyApp());
}

// My app class
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Local Assets Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

// My home page to display the local image
class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Local Assets Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // This is the local image I added from assets
            Image.asset(
              'assets/images/flutter_logo.png',
              width: 200,
              height: 200,
            ),
            const SizedBox(height: 20),
            const Text(
              'Flutter Logo from Local Assets',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'This image is loaded from the assets folder',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            // Added some information about local assets
            Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text(
                'To use local assets in Flutter, you need to:\n'
                '1. Add files to assets folder\n'
                '2. Update pubspec.yaml file\n'
                '3. Use Image.asset() to display them',
                style: TextStyle(height: 1.5),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
