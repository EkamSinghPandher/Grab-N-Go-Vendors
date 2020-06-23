import 'package:VendorApp/Models/Food.dart';
import 'package:VendorApp/main_pages/HomeScreen/ImageCapture.dart';
import 'package:provider/provider.dart';

import './food_cards.dart';
import 'package:flutter/material.dart';
import './ImageTitle.dart';
import 'package:VendorApp/Models/Vendor.dart';

class HomeScreenLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Food> menu = Provider.of<List<Food>>(context);
    Vendor vendor = Provider.of<Vendor>(context);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: vendor == null
          ? CircularProgressIndicator()
          : Column(children: [
              ImageTitle(
                height,
                width,
                Image.network(
                  vendor.stallImage,
                  fit: BoxFit.fill,
                  color: Colors.black45,
                  colorBlendMode: BlendMode.darken,
                ),
              ),
              Container(
                color: Colors.lightBlue,
                alignment: Alignment.centerLeft,
                child: Text(
                  'Menu',
                  style: TextStyle(fontSize: 18),
                ),
                padding: EdgeInsets.fromLTRB(13, 12, 0, 8),
              ),
              FoodCard(height, menu == null ? [] : menu),
            ]),
    );
  }
}
