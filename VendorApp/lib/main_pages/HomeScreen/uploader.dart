import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class Uploader extends StatefulWidget {
  final File file;

  Uploader({Key key, this.file}) : super(key: key);

  @override
  _UploaderState createState() => _UploaderState();
}

class _UploaderState extends State<Uploader> {
  final FirebaseStorage storage =
      FirebaseStorage(storageBucket: 'gs://grab-n--go.appspot.com/');

  StorageUploadTask uploadTask;

  void startUpload() {
    String filepath = 'images/${DateTime.now()}.png';

    setState(() {
      uploadTask = storage.ref().child(filepath).putFile(widget.file);
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
            ],
          );
        },
      );
    } else {
      return FlatButton.icon(
        onPressed: startUpload,
        icon: Icon(Icons.cloud_upload),
        label: Text('Upload'),
      );
    }
  }
}
