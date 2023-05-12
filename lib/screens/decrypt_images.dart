import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:steganography_frontend/components/side_drawer.dart';
import 'package:steganography_frontend/helper/api_calls.dart';
import 'package:steganography_frontend/screens/decrypt_response.dart';

String apilink = "https://dbff-119-82-85-116.ngrok-free.app";

class DecryptScreen extends StatefulWidget {
  const DecryptScreen({super.key});

  @override
  State<DecryptScreen> createState() => _DecryptScreenState();
}

class _DecryptScreenState extends State<DecryptScreen> {
  File? _selectedImages;

  Future<void> _pickImage() async {
    final pickedFile = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: false,
    );
    if (pickedFile != null) {
      setState(() {
        _selectedImages = File(pickedFile.files.single.path!);
      });
    }
  }

  Future<void> _saveImages() async {
    final appDocDir = await getApplicationDocumentsDirectory();
    final inputDir = Directory('${appDocDir.path}/input');
    if (!await inputDir.exists()) {
      await inputDir.create(recursive: true);
    }
    final imagePath = '${inputDir.path}/image_container.jpg';
    await _selectedImages?.copy(imagePath);
    SteganographyAPI api = SteganographyAPI(apilink);
    var resp = await api.decryptImage(_selectedImages!);

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ResponsePage2(
                  images: resp,
                )));
  }

  Widget _buildImagePreview() {
    if (_selectedImages == null) {
      return GestureDetector(
        onTap: _pickImage,
        child: Container(
          color: Colors.grey[200],
          child: Icon(
            Icons.add,
            color: Colors.grey[400],
            size: 48,
          ),
        ),
      );
    } else {
      return Image.file(
        _selectedImages!,
        fit: BoxFit.scaleDown,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: const MyDrawer(),
      body: Center(
        child: _buildImagePreview(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _selectedImages != null ? _saveImages : null,
        tooltip: 'Encode Images',
        backgroundColor: _selectedImages != null ? Colors.blue : Colors.grey,
        child: const Icon(Icons.navigate_next),
      ),
    );
  }
}
