import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerScreen extends StatefulWidget {
  const ImagePickerScreen({super.key});

  @override
  State<ImagePickerScreen> createState() => _ImagePickerScreenState();
}

class _ImagePickerScreenState extends State<ImagePickerScreen> {
  File? _image;
  final ImagePicker _picker = ImagePicker();

  Future getImage(ImageSource source) async {
    final XFile? image = await _picker.pickImage(source: source);
    setState(() {
      _image = File(image!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("image picker")),
      body: Center(
        child: Column(
          children: [
            _image != null ? Image.file(_image!) : Text("no image selected"),
            ElevatedButton(
              onPressed: () {
                getImage(ImageSource.camera);
              },
              child: Text("camera"),
            ),
            ElevatedButton(
              onPressed: () {
                getImage(ImageSource.gallery);
              },
              child: Text("gallery"),
            ),
          ],
        ),
      ),
    );
  }
}
