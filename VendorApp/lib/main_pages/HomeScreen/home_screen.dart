import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './ScreenLayout.dart';
import 'package:VendorApp/Models/Vendor.dart';

class HomeScreen extends StatefulWidget {
  static Vendor user;
  static const String id = 'home_screen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  /*void addFood(Image image, String name, int price, int stock) {
    menu.add(Food(
        foodImage: image,
        foodName: name,
        foodPrice: price,
        stock: stock,
        id: menu.length));
  }
  */

  @override
  Widget build(BuildContext context) {
    Vendor user = Provider.of<Vendor>(context);
    return Scaffold(
      body: Container(child: HomeScreenLayout(user)),
    );
  }
}
