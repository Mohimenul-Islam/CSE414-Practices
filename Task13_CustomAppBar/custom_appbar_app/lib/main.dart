import 'package:flutter/material.dart';

// Entry point for my app
void main() {
  runApp(const MyApp());
}

// Root widget of my app
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom AppBar Demo',
      debugShowCheckedModeBanner: false, // Remove debug banner
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
      ),
      home: const CustomAppBarPage(),
    );
  }
}

// Page showing my custom AppBar
class CustomAppBarPage extends StatelessWidget {
  const CustomAppBarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Custom AppBar with logo, title and actions
      appBar: AppBar(
        backgroundColor: Colors.green.shade700,
        elevation: 8, // Add shadow to AppBar
        
        // Leading icon or logo
        leading: Container(
          padding: const EdgeInsets.all(8),
          child: const FlutterLogo(),
        ),
        
        // Title with custom style
        title: const Text(
          'My Custom AppBar',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        
        // Action buttons on the right side
        actions: [
          // Search button
          IconButton(
            icon: const Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {
              // Show a simple message when search is pressed
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Search pressed')),
              );
            },
          ),
          
          // Menu button
          IconButton(
            icon: const Icon(
              Icons.menu,
              color: Colors.white,
            ),
            onPressed: () {
              // Show a simple message when menu is pressed
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Menu pressed')),
              );
            },
          ),
        ],
      ),
      
      // Simple body content
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'This page has a custom AppBar',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            const Text(
              'Try clicking on the action buttons!',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
