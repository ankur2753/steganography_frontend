import 'package:flutter/material.dart';
import 'package:steganography_frontend/screens/home.dart';
import 'package:steganography_frontend/screens/input_images.dart';
import 'screens/decrypt_images.dart';
import 'screens/about_us.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (_) => const HomeScreen(),
        '/encrypt': (_) => const InputImages(),
        '/decrypt': (_) => const DecryptScreen(),
        '/about': (_) => const AboutUsPage(),
      },
      theme: ThemeData.light(useMaterial3: true),
    );
  }
}
