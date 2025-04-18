import 'package:flutter/material.dart';

// Main function
void main() {
  runApp(const MyApp());
}

// My app class
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bottom Nav Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const BottomNavScreen(),
    );
  }
}

// This is my main screen with bottom navigation
class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  // Current tab index
  int _currentIndex = 0;
  
  // My three screens for each tab
  final List<Widget> _screens = [
    const HomeScreen(),
    const SearchScreen(),
    const ProfileScreen(),
  ];
  
  // Method to change tabs
  void _changeTab(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Bottom Navigation Demo'),
      ),
      // Show current screen based on selected tab
      body: _screens[_currentIndex],
      // Bottom navigation bar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _changeTab,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

// Home tab screen
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.home,
            size: 100,
            color: Colors.blue,
          ),
          const SizedBox(height: 20),
          const Text(
            'Home Screen',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              'Welcome to my app! This is the home screen where you can see the latest content.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey[600],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Search tab screen
class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          // Search bar
          TextField(
            decoration: InputDecoration(
              hintText: 'Search...',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          const SizedBox(height: 20),
          // Some search categories
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: [
                _buildCategoryCard('Nature', Icons.landscape),
                _buildCategoryCard('Food', Icons.fastfood),
                _buildCategoryCard('Travel', Icons.flight),
                _buildCategoryCard('Music', Icons.music_note),
                _buildCategoryCard('Sports', Icons.sports_soccer),
                _buildCategoryCard('Books', Icons.book),
              ],
            ),
          ),
        ],
      ),
    );
  }
  
  // Helper method to build category cards
  Widget _buildCategoryCard(String title, IconData icon) {
    return Card(
      elevation: 3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 40,
            color: Colors.blue,
          ),
          const SizedBox(height: 8),
          Text(title),
        ],
      ),
    );
  }
}

// Profile tab screen
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          // Profile picture
          const CircleAvatar(
            radius: 60,
            backgroundColor: Colors.blue,
            child: Icon(
              Icons.person,
              size: 80,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20),
          // Name
          const Text(
            'Mohimenul Islam',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            'Flutter Developer',
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 20),
          // Stats
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildStatColumn('Posts', '15'),
              _buildStatColumn('Followers', '255'),
              _buildStatColumn('Following', '123'),
            ],
          ),
          const SizedBox(height: 20),
          // Edit profile button
          ElevatedButton(
            onPressed: () {},
            child: const Text('Edit Profile'),
          ),
          const SizedBox(height: 20),
          // Info cards
          _buildInfoCard('Email', 'example@email.com', Icons.email),
          _buildInfoCard('Phone', '+123 456 7890', Icons.phone),
          _buildInfoCard('Location', 'Dhaka, Bangladesh', Icons.location_on),
        ],
      ),
    );
  }
  
  // Helper method for stats display
  Widget _buildStatColumn(String title, String count) {
    return Column(
      children: [
        Text(
          count,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(title),
      ],
    );
  }
  
  // Helper method for info cards
  Widget _buildInfoCard(String title, String content, IconData icon) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Icon(icon, color: Colors.blue),
        title: Text(title),
        subtitle: Text(content),
      ),
    );
  }
}
