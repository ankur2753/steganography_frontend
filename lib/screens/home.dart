import 'package:flutter/material.dart';
import 'package:steganography_frontend/components/my_kard.dart';
import 'package:steganography_frontend/components/side_drawer.dart';
import 'dart:math';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: const [
                // Padding(
                //   padding: EdgeInsets.all(8.0),
                //   child: Kard(
                //     txt: 'ENCRYPT',
                //     kolor: [
                //       Color(0xFF000428),
                //       Color(0xFF004e92),
                //     ],
                //     destination: '/encrypt',
                //     imageUrl:
                //         'https://img.freepik.com/premium-psd/lock-3d-icon_642950-20.jpg?w=740',
                //   ),
                // ),
                // Padding(
                //   padding: EdgeInsets.all(8.0),
                //   child: Kard(
                //     txt: 'DECRYPT',
                //     kolor: [
                //       Color(0xFF42275a),
                //       Color(0xFF734b6d),
                //     ],
                //     destination: '/decrypt',
                //     imageUrl:
                //         'https://w7.pngwing.com/pngs/987/168/png-transparent-lock-3d-icon.png',
                //   ),
                // ),
                MyDrawer(),
                Center(
                  child: Text("this"),
                )
              ],
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
