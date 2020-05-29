import './FourButtons.dart';
import 'package:flutter/material.dart';
import './ImageTitle.dart';

class HomeScreenLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Column(children: [
      ImageTitle(height, width, 'Xiao Long Bao Stall', Image.asset(
          'images/shop-image.jpg',
          fit: BoxFit.cover,
        )),
      FourButton(height)
    ]);
  }
}
