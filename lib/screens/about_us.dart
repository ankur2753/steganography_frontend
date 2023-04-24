import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            SizedBox(height: 16.0),
            Text(
              'We are a group of four undergraduate students working on a project on steganography, under the guidance of our professor Rakesh Kalshetty.',
              style: TextStyle(
                fontSize: 19.0,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Steganography is the practice of concealing a message, image, or file within another message, image, or file. The goal of steganography is to hide the existence of the secret message, and it differs from cryptography in that it does not aim to make the message unintelligible, but rather to keep it a secret. Steganography has been used throughout history, from ancient Greece to modern-day digital communication. It has various applications, including secret communication, digital watermarking, and copyright protection.',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(8.0),
        color: Colors.grey[200],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'Made with ',
              style: TextStyle(fontSize: 18.0),
            ),
            Icon(
              Icons.favorite,
              color: Colors.red,
            ),
            Text(
              ' at Sapthagiri College of Engineering',
              style: TextStyle(fontSize: 18.0),
            ),
          ],
        ),
      ),
    );
  }
}
