import 'package:flutter/material.dart';

class FourButton extends StatelessWidget {
  final double height;

  FourButton(this.height);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.52,
      child: GridView(
        padding: EdgeInsets.all(15),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 9 / 10,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15),
        children: <Widget>[
          Container(
            alignment: Alignment.bottomCenter,
            child: Text('Edit menu'),
            decoration: BoxDecoration(color: Colors.grey),
          ),
          Container(
              alignment: Alignment.bottomCenter,
              child: Text('Add Promo'),
              decoration: BoxDecoration(color: Colors.grey)),
          Container(
              alignment: Alignment.bottomCenter,
              child: Text('Adjust Stock'),
              decoration: BoxDecoration(color: Colors.grey)),
          Container(
              alignment: Alignment.bottomCenter,
              child: Text('Edit Image'),
              decoration: BoxDecoration(color: Colors.grey)),
        ],
      ),
    );
  }
}
