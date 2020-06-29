import 'dart:io';
import 'package:VendorApp/Models/Vendor.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class Uploader extends StatefulWidget {
  final File file;
  final Vendor vendor;
  final String foodID;

  Uploader({Key key, this.file, this.vendor, this.foodID}) : super(key: key);

  @override
  _UploaderState createState() => _UploaderState();
}

class _UploaderState extends State<Uploader> {
  String filepath = '';
  String downloadURL;

  final FirebaseStorage storage =
      FirebaseStorage(storageBucket: 'gs://grab-n--go.appspot.com/');

  StorageUploadTask uploadTask;

  void startUpload() {
    setState(() {
      filepath = 'images/${widget.vendor.uid}/${widget.foodID}.png';
    });

    setState(() {
      uploadTask = storage.ref().child(filepath).putFile(widget.file);
    });
  }

  Future downloadImage() async {
    StorageReference reference = FirebaseStorage.instance.ref().child(filepath);
    String downloadAddress = await reference.getDownloadURL();
    setState(() {
      downloadURL = downloadAddress;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (uploadTask != null) {
      return StreamBuilder<StorageTaskEvent>(
        stream: uploadTask.events,
        builder: (context, snapshot) {
          var event = snapshot?.data?.snapshot;
          double progressPercent =
              event != null ? event.bytesTransferred / event.totalByteCount : 0;
          return Column(
            children: [
              if (uploadTask.isComplete) Text('Done'),
              if (uploadTask.isPaused)
                FlatButton(
                  onPressed: uploadTask.resume,
                  child: Icon(Icons.play_arrow),
                ),
              if (uploadTask.isInProgress)
                FlatButton(
                  onPressed: uploadTask.pause,
                  child: Icon(Icons.pause),
                ),
              LinearProgressIndicator(
                value: progressPercent,
              ),
              Text('${(progressPercent * 100).toStringAsFixed(2)}'),
              SizedBox(
                height: 20.0,
              ),
              if (uploadTask.isComplete)
                FlatButton(
                  onPressed: () async {
                    await downloadImage();
                    Navigator.pop(context, downloadURL);
                  },
                  child: Text("back"),
                ),
            ],
          );
        },
      );
    } else {
      return FlatButton.icon(
        onPressed: () {
          startUpload();
        },
        icon: Icon(Icons.cloud_upload),
        label: Text('Upload'),
      );
    }
  }
}
