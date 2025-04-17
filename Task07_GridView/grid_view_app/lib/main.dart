import 'package:flutter/material.dart';

// This is my main function where app starts
void main() {
  runApp(const MyApp());
}

// This is my app
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Grid View App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
      home: const ImageGridPage(),
    );
  }
}

// This is my page that shows images in a grid
class ImageGridPage extends StatelessWidget {
  const ImageGridPage({super.key});

  @override
  Widget build(BuildContext context) {
    // I'm creating a list of image URLs
    List<String> imageUrls = [
      'https://picsum.photos/id/10/300/300',
      'https://picsum.photos/id/20/300/300',
      'https://picsum.photos/id/30/300/300',
      'https://picsum.photos/id/40/300/300',
      'https://picsum.photos/id/50/300/300',
      'https://picsum.photos/id/60/300/300',
      'https://picsum.photos/id/70/300/300',
      'https://picsum.photos/id/80/300/300',
      'https://picsum.photos/id/90/300/300',
      'https://picsum.photos/id/100/300/300',
      'https://picsum.photos/id/110/300/300',
      'https://picsum.photos/id/120/300/300',
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Image Grid View'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        // I'm using GridView.builder to create a grid of images
        child: GridView.builder(
          // This makes the grid responsive with 2 columns
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,  // Two columns
            crossAxisSpacing: 10,  // Horizontal space between items
            mainAxisSpacing: 10,  // Vertical space between items
          ),
          itemCount: imageUrls.length,
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                // This adds a border around each image
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              // I'm using ClipRRect to make the image corners rounded
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  imageUrls[index],
                  fit: BoxFit.cover,  // This makes the image fill the container
                  // I added a loading indicator while images load
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                  // This shows an error icon if the image fails to load
                  errorBuilder: (context, error, stackTrace) {
                    return const Center(
                      child: Icon(
                        Icons.error,
                        color: Colors.red,
                      ),
                    );
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
