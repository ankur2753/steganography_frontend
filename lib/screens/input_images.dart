import 'dart:io';
import 'package:steganography_frontend/components/side_drawer.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:steganography_frontend/helper/api_calls.dart';
import 'package:steganography_frontend/screens/decrypt_images.dart';
import 'package:steganography_frontend/screens/encrypt_response.dart';
import 'package:steganography_frontend/helper/covert_image.dart';

class InputImages extends StatefulWidget {
  const InputImages({super.key});

  @override
  InputImagesState createState() => InputImagesState();
}

class InputImagesState extends State<InputImages> {
  final List<File> _selectedImages = [];

  Future<void> _pickImage() async {
    final pickedFile = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: false,
    );
    if (pickedFile != null) {
      setState(() {
        _selectedImages.add(File(pickedFile.files.single.path!));
      });
    }
  }

  Future<void> _saveImages() async {
    SteganographyAPI api = SteganographyAPI(apilink);
    for (var i = 0; i < _selectedImages.length; i++) {
      File img = await TransFormImages.to200x200(_selectedImages[i], 200, 200);
      _selectedImages[i] = img;
    }
    List<File> secret = _selectedImages.sublist(1);
    File resp = await api.encryptFile(_selectedImages[0], secret);
    print(resp);
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: ((context) => ResponsePage(responseFile: resp))));
  }

  Widget _buildImagePreview(int index) {
    if (index >= _selectedImages.length) {
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
      final screenSize = MediaQuery.of(context).size;
      final maxWidth = screenSize.width * 0.9;
      final maxHeight = screenSize.height * 0.5;
      return Image.file(
        _selectedImages[index],
        fit: BoxFit.scaleDown,
        height: maxHeight,
        width: maxWidth,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Images For Encryption'),
      ),
      drawer: const MyDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 500,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              mainAxisExtent: 600,
            ),
            itemCount: 4,
            itemBuilder: (BuildContext context, int index) {
              String label = index == 0 ? 'cover image' : 'secret image $index';
              return Column(
                children: [
                  Text(
                    label,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 10),
                  _buildImagePreview(index),
                ],
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _selectedImages.length == 4 ? _saveImages : null,
        tooltip: 'Encode Images',
        backgroundColor:
            _selectedImages.length == 4 ? Colors.blue : Colors.grey,
        child: const Icon(Icons.navigate_next),
      ),
    );
  }
}
