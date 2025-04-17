import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom Card Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const CardListPage(),
    );
  }
}

class CardItem {
  final String imageUrl;
  final String title;
  final String subtitle;
  final String description;

  CardItem({
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.description,
  });
}

class CardListPage extends StatelessWidget {
  const CardListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<CardItem> items = [
      CardItem(
        imageUrl: 'https://picsum.photos/id/1018/500/300',
        title: 'Mountain View',
        subtitle: 'Nature Photography',
        description: 'This beautiful mountain view was captured during a hiking trip. The scenery is breathtaking with snow-capped peaks and clear blue skies.',
      ),
      CardItem(
        imageUrl: 'https://picsum.photos/id/1015/500/300',
        title: 'River and Forest',
        subtitle: 'Landscape Shot',
        description: 'A serene river flowing through a lush green forest. The sound of water and birds creates a peaceful atmosphere perfect for relaxation.',
      ),
      CardItem(
        imageUrl: 'https://picsum.photos/id/1019/500/300',
        title: 'Sunset at Beach',
        subtitle: 'Evening Photography',
        description: 'The golden sun setting over the horizon, painting the sky with vibrant colors of orange, pink, and purple. The waves gently crash against the shore.',
      ),
      CardItem(
        imageUrl: 'https://picsum.photos/id/1022/500/300',
        title: 'Northern Lights',
        subtitle: 'Night Sky',
        description: 'The mesmerizing aurora borealis dancing across the night sky, creating a natural light show that illuminates the darkness with its green and blue hues.',
      ),
      CardItem(
        imageUrl: 'https://picsum.photos/id/1023/500/300',
        title: 'Wildlife Deer',
        subtitle: 'Animal Photography',
        description: 'A majestic deer spotted in its natural habitat, cautiously observing its surroundings. These gentle creatures are known for their grace and beauty.',
      ),
      CardItem(
        imageUrl: 'https://picsum.photos/id/1024/500/300',
        title: 'Waterfall',
        subtitle: 'Nature\'s Power',
        description: 'A powerful waterfall cascading down rocky cliffs, creating misty sprays and a thunderous sound. Waterfalls represent the raw power and beauty of nature.',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Custom Cards'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return CustomCard(item: items[index]);
          },
        ),
      ),
    );
  }
}

class CustomCard extends StatefulWidget {
  final CardItem item;

  const CustomCard({super.key, required this.item});

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> with SingleTickerProviderStateMixin {
  bool _isPressed = false;
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
    );
    
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: GestureDetector(
        onTapDown: (_) {
          setState(() {
            _isPressed = true;
          });
          _controller.forward();
        },
        onTapUp: (_) {
          setState(() {
            _isPressed = false;
          });
          _controller.reverse();
        },
        onTapCancel: () {
          setState(() {
            _isPressed = false;
          });
          _controller.reverse();
        },
        onTap: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text(widget.item.title),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(
                      widget.item.imageUrl,
                      fit: BoxFit.cover,
                      height: 200,
                      width: double.infinity,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(Icons.error);
                      },
                    ),
                    const SizedBox(height: 16),
                    Text(
                      widget.item.subtitle,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(widget.item.description),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Close'),
                ),
              ],
            ),
          );
        },
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Transform.scale(
              scale: _scaleAnimation.value,
              child: child,
            );
          },
          child: Card(
            elevation: _isPressed ? 1.0 : 4.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                  child: SizedBox(
                    height: 180,
                    width: double.infinity,
                    child: Image.network(
                      widget.item.imageUrl,
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                      errorBuilder: (context, error, stackTrace) {
                        return const Center(
                          child: Icon(
                            Icons.error,
                            color: Colors.red,
                            size: 50,
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.item.title,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        widget.item.subtitle,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[700],
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        widget.item.description,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 14),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: const Text('View Details'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
