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
        child: Stack(
      children: <Widget>[
        Container(width: width, height: height * 0.56, child: image),
      ],
    ));
  }
}
