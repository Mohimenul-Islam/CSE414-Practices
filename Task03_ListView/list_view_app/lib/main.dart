import 'package:flutter/material.dart';

// Entry point for my ListView application
void main() {
  runApp(const MyApp());
}

// Root widget of my application
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ListView Demo',
      debugShowCheckedModeBanner: false, // For a cleaner UI experience
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange), // Using orange theme for visual appeal
      ),
      home: const ListViewPage(),
    );
  }
}

class ListViewPage extends StatelessWidget {
  const ListViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Dynamically generate 50 items with unique numbers
    final List<int> items = List<int>.generate(50, (index) => index + 1);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Task 03: ListView'),
      ),
      body: ListView.builder(
        // Adding padding for better visual spacing
        padding: const EdgeInsets.all(10),
        itemCount: items.length,
        itemBuilder: (context, index) {
          // Wrapping each list item in a Card for better visual separation
          return Card(
            elevation: 2,
            margin: const EdgeInsets.symmetric(vertical: 5),
            child: ListTile(
              // Creating a circular avatar with the item number
              leading: CircleAvatar(
                backgroundColor: Theme.of(context).colorScheme.primary,
                child: Text(
                  '${items[index]}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // Adding formatted title with the item number
              title: Text(
                'Item Number ${items[index]}',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              // Adding subtitle for additional information
              subtitle: Text('This is list item at position ${items[index]}'),
              // Adding trailing icon for better UI
              trailing: const Icon(Icons.arrow_forward_ios),
              // Custom padding for list items
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
            ),
          );
        },
      ),
    );
  }
}
