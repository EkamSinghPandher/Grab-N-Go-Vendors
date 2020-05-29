import 'package:flutter/material.dart';

class ImageTitle extends StatelessWidget {
  final double height;
  final double width;
  final String title;
  final Image image;

  const ImageTitle(this.height, this.width, this.title, this.image);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(height: height * 0.33, width: width, child: image),
          const SizedBox(height: 15),
          Text(
            title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
