import 'package:flutter/material.dart';

// This is the entry point for our Flutter application
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // I created a MaterialApp which provides navigation and theming
    return MaterialApp(
      title: 'Navigation Demo',
      theme: ThemeData(
        // I set the theme color to blue
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      // The first screen is set as the home screen
      home: const FirstScreen(),
    );
  }
}

// I created a stateless widget for the first screen
class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Scaffold provides the basic structure for the screen
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('First Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'This is the First Screen',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            // This button navigates to the second screen when pressed
            ElevatedButton(
              onPressed: () {
                // I used Navigator.push to navigate to the second screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SecondScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              ),
              child: const Text(
                'Go to Second Screen',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// I created a stateless widget for the second screen
class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Second Screen'),
        // I added a back button in the app bar that automatically handles navigation
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Navigator.pop removes this screen from the stack and returns to the previous one
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'This is the Second Screen',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            // This button also returns to the first screen
            ElevatedButton(
              onPressed: () {
                // Another way to go back to the previous screen
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              ),
              child: const Text(
                'Go Back to First Screen',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
