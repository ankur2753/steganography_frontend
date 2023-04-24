import 'dart:convert';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image/image.dart' as img;

class TransFormImages {
  static Widget base64StringToImage(String base64String) {
    final bytes = base64.decode(base64String);
    return Image.memory(bytes);
  }

  static Future<File> to200x200(
      File file, int targetWidth, int targetHeight) async {
    final image = img.decodeImage(await file.readAsBytes());
    final compressedImage =
        img.copyResize(image!, width: targetWidth, height: targetHeight);
    final compressedFile = File('${file.path.split('.').first}_compressed.jpg')
      ..writeAsBytesSync(img.encodeJpg(compressedImage, quality: 90));
    return compressedFile;
  }
}
