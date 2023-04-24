import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';

class ResponsePage2 extends StatefulWidget {
  final List<File> images;

  ResponsePage2({required this.images});

  @override
  _ResponsePage2State createState() => _ResponsePage2State();
}

class _ResponsePage2State extends State<ResponsePage2> {
  late List<Uint8List> _imageBytesList;

  @override
  void initState() {
    super.initState();
    _loadImages();
  }

  Future<void> _loadImages() async {
    _imageBytesList = [];
    for (var image in widget.images) {
      var imageBytes = await image.readAsBytes();
      _imageBytesList.add(imageBytes);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Response'),
      ),
      body: _imageBytesList.isNotEmpty
          ? Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: _imageBytesList
                    .map((imageBytes) => Image.memory(imageBytes))
                    .toList(),
              ),
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
