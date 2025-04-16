import 'package:flutter/material.dart';

// Main entry point for my button press application
void main() {
  runApp(const MyApp());
}

// Root widget for my application
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Button Press Demo',
      debugShowCheckedModeBanner: false, // Removing debug banner for cleaner UI
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: const ButtonPressPage(),
    );
  }
}

// Creating a StatefulWidget to demonstrate state management
class ButtonPressPage extends StatefulWidget {
  const ButtonPressPage({super.key});

  @override
  State<ButtonPressPage> createState() => _ButtonPressPageState();
}

class _ButtonPressPageState extends State<ButtonPressPage> {
  // Initialize text that will be displayed and changed
  String displayText = 'Press the Button';
  
  // My implementation to handle button press and update state
  void _onButtonPressed() {
    setState(() {
      // Using setState to update the UI when text changes
      displayText = 'Button Pressed';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Task 02: Button Press'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Text widget to display the changing message
            Text(
              displayText,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30), // Added spacing for better layout
            // My custom styled button with press handler
            ElevatedButton(
              onPressed: _onButtonPressed,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              ),
              child: const Text(
                'Press Me',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
