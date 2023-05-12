import 'package:flutter/material.dart';
import 'package:steganography_frontend/components/my_kard.dart';
import 'package:steganography_frontend/components/side_drawer.dart';
import 'dart:math';
import 'package:flutter_svg/flutter_svg.dart';

import 'about_us.dart';
import 'decrypt_images.dart';
import 'input_images.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Steganography'),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Colors.black,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.lock,
                  color: Colors.black,
                ),
                label: 'Encrypy',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.lock_open,
                  color: Colors.black,
                ),
                label: 'Decrypt',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                  color: Colors.black,
                ),
                label: 'About',
              ),
            ],
            currentIndex: 0,
            selectedItemColor: Colors.blue,
            onTap: (int index) {
              // Handle navigation to the corresponding page here
              switch (index) {
                case 0:
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                  );
                  break;
                case 1:
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const InputImages()),
                  );
                  break;
                case 2:
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DecryptScreen()),
                  );
                  break;
                case 3:
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AboutUsPage()),
                  );
                  break;
              }
            },
          ),
        ),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: SvgPicture.asset(
              'assets/background.svg',
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: const [],
            ),
          ),
        ],
      ),
    );
  }
}

class BackgroundPainter extends CustomPainter {
  final Random random = Random();
  final List<Color> colors = [
    Colors.blue[300]!,
    Colors.pink[200]!,
    Colors.yellow[200]!,
    Colors.purple[200]!,
    Colors.green[200]!,
    Colors.orange[200]!,
  ];

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    for (var i = 0; i < 10; i++) {
      final color = colors[random.nextInt(colors.length)];
      paint.color = color.withOpacity(0.7);
      final radius = random.nextDouble() * 150 + 50;
      final x = random.nextDouble() * size.width;
      final y = random.nextDouble() * size.height;
      canvas.drawCircle(Offset(x, y), radius, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
