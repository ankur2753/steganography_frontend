import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ResponsePage extends StatelessWidget {
  final File responseFile;

  ResponsePage({required this.responseFile});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Response'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.file(responseFile),
            SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () => _downloadImage(context, responseFile),
              icon: Icon(Icons.download_rounded),
              label: Text('Download '),
            ),
          ],
        ),
      ),
    );
  }

  void _downloadImage(BuildContext context, File file) async {
    final result = await Directory.systemTemp.create();
    final fileName = 'image.jpg';
    final filePath = '${result.path}/$fileName';
    final newFile = await file.copy(filePath);

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Image downloaded to $filePath'),
    ));
  }
}
