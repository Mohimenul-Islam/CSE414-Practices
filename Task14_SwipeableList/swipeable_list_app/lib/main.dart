import 'package:flutter/material.dart';

// Entry point of my app
void main() {
  runApp(const MyApp());
}

// Root widget of my app
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Swipeable List Demo',
      debugShowCheckedModeBanner: false, // Remove debug banner
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
      ),
      home: const SwipeableListPage(),
    );
  }
}

// Page with a swipeable list
class SwipeableListPage extends StatefulWidget {
  const SwipeableListPage({super.key});

  @override
  State<SwipeableListPage> createState() => _SwipeableListPageState();
}

class _SwipeableListPageState extends State<SwipeableListPage> {
  // Create some dummy list items
  final List<String> _items = List.generate(
    15, 
    (index) => 'Item ${index + 1}'
  );

  // Function to delete item
  void _deleteItem(int index) {
    setState(() {
      // Remove the item from list
      _items.removeAt(index);
      
      // Show a message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Item ${index + 1} deleted'),
          duration: const Duration(seconds: 1),
        ),
      );
    });
  }

  // Function to edit item
  void _editItem(int index) {
    // Show a message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Editing Item ${index + 1}'),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Task 14: Swipeable List'),
      ),
      body: ListView.builder(
        itemCount: _items.length,
        itemBuilder: (context, index) {
          // Use Dismissible widget to make items swipeable
          return Dismissible(
            // Key must be unique for each item
            key: Key(_items[index]),
            
            // Create background for swiping right (delete)
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 20),
              child: const Icon(
                Icons.delete,
                color: Colors.white,
              ),
            ),
            
            // Create background for swiping left (edit)
            secondaryBackground: Container(
              color: Colors.blue,
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(right: 20),
              child: const Icon(
                Icons.edit,
                color: Colors.white,
              ),
            ),
            
            // Handle swipe confirmation
            confirmDismiss: (direction) async {
              if (direction == DismissDirection.startToEnd) {
                // Swiping right to delete
                _deleteItem(index);
                return true;
              } else {
                // Swiping left to edit
                _editItem(index);
                return false; // Don't remove item when editing
              }
            },
            
            // The actual list item
            child: Card(
              margin: const EdgeInsets.symmetric(
                horizontal: 15, 
                vertical: 5,
              ),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.purple.shade300,
                  child: Text('${index + 1}'),
                ),
                title: Text(_items[index]),
                subtitle: const Text('Swipe left to edit, right to delete'),
              ),
            ),
          );
        },
      ),
    );
  }
}
