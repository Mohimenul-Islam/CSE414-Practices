import 'package:flutter/material.dart';

// Entry point for my Flutter app
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Text Styling App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const TextStylingHomePage(title: 'Text Styling Demo'),
    );
  }
}

// I created this StatefulWidget for my home page
class TextStylingHomePage extends StatefulWidget {
  const TextStylingHomePage({super.key, required this.title});

  final String title;

  @override
  State<TextStylingHomePage> createState() => _TextStylingHomePageState();
}

class _TextStylingHomePageState extends State<TextStylingHomePage> {
  // I'll use this to switch between different examples
  int _currentIndex = 0;

  // These are all the view options I want to showcase
  final List<Widget> _views = [
    const BasicTextStylesView(),
    const TextInColumnView(),
    const TextInRowView(),
    const CustomFontView(),
    const RichTextView(),
  ];

  void _changeView(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // I built this scaffold with bottom navigation to switch between examples
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: _views[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _changeView,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.text_fields),
            label: 'Basic',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.view_column),
            label: 'Column',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.view_array),
            label: 'Row',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.font_download),
            label: 'Fonts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.format_color_text),
            label: 'Rich Text',
          ),
        ],
      ),
    );
  }
}

// Show different basic text styles
class BasicTextStylesView extends StatelessWidget {
  const BasicTextStylesView({super.key});

  @override
  Widget build(BuildContext context) {
    // I'm using a Padding and SingleChildScrollView to make it look nice
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Basic Text Styling Examples',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
              ),
            ),
            const SizedBox(height: 20),
            // I used different font sizes here
            Text(
              'This text has a font size of 30',
              style: TextStyle(fontSize: 30),
            ),
            Text(
              'This text has a font size of 20',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              'This text has a font size of 10',
              style: TextStyle(fontSize: 10),
            ),
            const SizedBox(height: 20),
            // Now I'll show different font weights
            Text(
              'Normal font weight',
              style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20),
            ),
            Text(
              'Bold font weight',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Text(
              'Font weight 900 (extra bold)',
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
            ),
            Text(
              'Font weight 300 (light)',
              style: TextStyle(fontWeight: FontWeight.w300, fontSize: 20),
            ),
            const SizedBox(height: 20),
            // Different text colors
            Text(
              'This text is red',
              style: TextStyle(color: Colors.red, fontSize: 20),
            ),
            Text(
              'This text is blue',
              style: TextStyle(color: Colors.blue, fontSize: 20),
            ),
            Text(
              'This text is green',
              style: TextStyle(color: Colors.green, fontSize: 20),
            ),
            Text(
              'This text has a custom color',
              style: TextStyle(color: Color(0xFF9C27B0), fontSize: 20),
            ),
            const SizedBox(height: 20),
            // Combining styles
            Text(
              'Big, bold and blue!',
              style: TextStyle(
                fontSize: 30, 
                fontWeight: FontWeight.bold, 
                color: Colors.blue,
                letterSpacing: 2.0,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Italic, small and red',
              style: TextStyle(
                fontSize: 16, 
                fontStyle: FontStyle.italic, 
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Text in Column view
class TextInColumnView extends StatelessWidget {
  const TextInColumnView({super.key});

  @override
  Widget build(BuildContext context) {
    // I'm using a Column layout to arrange my texts vertically
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Text in Column Layout',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.purple,
            ),
          ),
          const SizedBox(height: 20),
          // I'm using custom decoration and alignment for these texts in a column
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.amberAccent.withOpacity(0.2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Header Text',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Subheader with medium weight',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.indigo.shade700,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  'This is the body text that provides more details about the header and subheader above. It uses a smaller font size and normal weight.',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          // Creating a card-like design with text in a column
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              children: [
                Text(
                  'SPECIAL OFFER',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: Colors.red,
                    letterSpacing: 1.5,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '50% OFF',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Limited time only',
                  style: TextStyle(
                    fontSize: 14,
                    fontStyle: FontStyle.italic,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Text in Row view
class TextInRowView extends StatelessWidget {
  const TextInRowView({super.key});

  @override
  Widget build(BuildContext context) {
    // Here I'm showcasing how to use text styles within Row widgets
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Text in Row Layout',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
            const SizedBox(height: 20),
            // Simple row with differently styled texts
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.teal.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Text(
                    'Name: ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    'Mohimenul Islam',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.teal,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            // Row with wrapped text and icons
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.orange.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Icon(Icons.star, color: Colors.orange),
                  const SizedBox(width: 5),
                  Text(
                    '4.9',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.orange,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    '(128 reviews)',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            // Row with spaced text elements
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total Price:',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    '\$120.00',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[800],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Row with Flexible and Expanded for responsive text
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.pink.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      'Product description with a longer text that wraps to the next line',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.pink[900],
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    flex: 1,
                    child: Text(
                      'In Stock',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Custom font demo
class CustomFontView extends StatelessWidget {
  const CustomFontView({super.key});

  @override
  Widget build(BuildContext context) {
    // This would require adding custom fonts to pubspec.yaml
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Custom Fonts',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'To use custom fonts, you would need to:',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              '1. Add font files to assets/fonts/',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 5),
            Text(
              '2. Configure pubspec.yaml',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 5),
            Text(
              '3. Use the fontFamily parameter',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Example:\nTextStyle(fontFamily: "Montserrat")',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Rich text examples
class RichTextView extends StatelessWidget {
  const RichTextView({super.key});

  @override
  Widget build(BuildContext context) {
    // I wanted to show how to use RichText and TextSpan for mixed styling
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Rich Text Examples',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple,
            ),
          ),
          const SizedBox(height: 20),
          // Basic RichText example
          RichText(
            text: TextSpan(
              style: TextStyle(fontSize: 18, color: Colors.black),
              children: [
                TextSpan(text: 'This is '),
                TextSpan(
                  text: 'bold',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(text: ' and this is '),
                TextSpan(
                  text: 'italic',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
                TextSpan(text: ' text in one line.'),
              ],
            ),
          ),
          const SizedBox(height: 15),
          // More complex example
          RichText(
            text: TextSpan(
              style: TextStyle(fontSize: 16, color: Colors.black),
              children: [
                TextSpan(text: 'Check out our '),
                TextSpan(
                  text: 'SPECIAL OFFER',
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
                TextSpan(text: ' with '),
                TextSpan(
                  text: '50% OFF',
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                TextSpan(text: ' on selected items!'),
              ],
            ),
          ),
          const SizedBox(height: 20),
          // Styled link example
          RichText(
            text: TextSpan(
              style: TextStyle(fontSize: 16, color: Colors.black),
              children: [
                TextSpan(text: 'Visit our '),
                TextSpan(
                  text: 'website',
                  style: TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextSpan(text: ' for more information.'),
              ],
            ),
          ),
          const SizedBox(height: 20),
          // Price tag style
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(8),
            ),
            child: RichText(
              text: TextSpan(
                style: TextStyle(fontSize: 16, color: Colors.black),
                children: [
                  TextSpan(text: 'Price: '),
                  TextSpan(
                    text: '\$99',
                    style: TextStyle(
                      color: Colors.red[800],
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                  TextSpan(text: '  '),
                  TextSpan(
                    text: '\$49',
                    style: TextStyle(
                      color: Colors.green[800],
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  TextSpan(text: ' (50% off)'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
