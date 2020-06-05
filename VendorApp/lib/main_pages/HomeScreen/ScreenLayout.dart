import './food_cards.dart';
import 'package:flutter/material.dart';
import './ImageTitle.dart';
import 'package:VendorApp/Models/Vendor.dart';

class HomeScreenLayout extends StatelessWidget {
  final Vendor vendor;

  const HomeScreenLayout(this.vendor);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(children: [
        ImageTitle(
            height,
            width,
            vendor.stallName,
            Image.asset(
              vendor.stallImage,
              fit: BoxFit.cover,
              color: Colors.black45,
              colorBlendMode: BlendMode.darken,
            )),
        Container(
          color: Colors.lightBlue,
          alignment: Alignment.centerLeft,
          child: Text(
            'Menu',
            style: TextStyle(fontSize: 18),
          ),
          padding: EdgeInsets.fromLTRB(13, 12, 0, 8),
        ),
        FoodCard(height, vendor.menu)
      ]),
    );
  }
}