import 'dart:io';

import 'package:VendorApp/main_pages/HomeScreen/uploader.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';

class ImageCapture extends StatefulWidget {
  @override
  _ImageCaptureState createState() => _ImageCaptureState();
}

class _ImageCaptureState extends State<ImageCapture> {
  File _imageFile;

  Future<void> pickImage(ImageSource source) async {
    File selected = await ImagePicker.pickImage(source: source);
    setState(() {
      _imageFile = selected;
    });
  }

  Future<void> cropImage() async {
    File cropped = await ImageCropper.cropImage(
      sourcePath: _imageFile.path,
    );
    setState(() {
      _imageFile = cropped ?? _imageFile;
    });
  }

  void clear() {
    setState(() => _imageFile = null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: [
            IconButton(
              icon: Icon(Icons.photo_camera),
              onPressed: () => pickImage(ImageSource.camera),
            ),
            IconButton(
              icon: Icon(Icons.photo_library),
              onPressed: () => pickImage(ImageSource.gallery),
            )
          ],
        ),
      ),
      body: ListView(
        children: [
          if (_imageFile != null) ...[
            Image.file(_imageFile),
            Row(
              children: [
                FlatButton(
                  onPressed: cropImage,
                  child: Icon(Icons.crop),
                ),
                FlatButton(
                  onPressed: clear,
                  child: Icon(Icons.refresh),
                )
              ],
            ),
            Uploader(file: _imageFile),
          ],
        ],
      ),
    );
  }
}
