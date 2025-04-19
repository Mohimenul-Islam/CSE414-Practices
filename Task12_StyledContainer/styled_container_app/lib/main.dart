import 'package:flutter/material.dart';

// My app's entry point
void main() {
  runApp(const MyApp());
}

// Root widget of my app
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Styled Container Demo',
      debugShowCheckedModeBanner: false, // Remove debug banner
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
      ),
      home: const StyledContainerPage(),
    );
  }
}

// Page that shows my styled container
class StyledContainerPage extends StatelessWidget {
  const StyledContainerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Task 12: Styled Container'),
      ),
      body: Center(
        child: Container(
          // Set width and height
          width: 300,
          height: 200,
          
          // Add some padding inside container
          padding: const EdgeInsets.all(20),
          
          // Style the container with decoration
          decoration: BoxDecoration(
            // Set background color
            color: Colors.blue.shade100,
            
            // Make the corners rounded
            borderRadius: BorderRadius.circular(15),
            
            // Add shadow effect
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          
          // Add text inside the container
          child: const Center(
            child: Text(
              'Hello, this is my styled container!',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.indigo,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
