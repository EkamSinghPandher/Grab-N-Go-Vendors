import 'package:VendorApp/Models/Location.dart';
import 'package:flutter/material.dart';
import './ScreenLayout.dart';
import 'package:VendorApp/Models/Food.dart';
import 'package:VendorApp/Models/Vendor.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'home_screen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static List<Food> menu = [
    Food(
        foodImage: Image.asset('images/xlbfood.png'),
        foodName: 'Food name',
        foodPrice: 0,
        stock: 10,
        id: 0),
    Food(
        foodImage: Image.asset('images/xlbfood.png'),
        foodName: 'Food name',
        foodPrice: 0,
        stock: 10,
        id: 1),
    Food(
        foodImage: Image.asset('images/xlbfood.png'),
        foodName: 'Food name',
        foodPrice: 0,
        stock: 10,
        id: 2),
    Food(
        foodImage: Image.asset('images/xlbfood.png'),
        foodName: 'Food name',
        foodPrice: 0,
        stock: 10,
        id: 3),
  ];
  Vendor thisVendor = Vendor(
    location: Location.utown1,
    stallName: 'Xiao Long Bao Stall',
    email: 'dummyemail',
    password: 'dummypass',
    phoneNumber: 999,
    menu: menu,
    stallImage: 'images/shop-image.jpg',
  );

  void addFood(Image image, String name, int price, int stock) {
    menu.add(Food(
        foodImage: image,
        foodName: name,
        foodPrice: price,
        stock: stock,
        id: menu.length));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(child: HomeScreenLayout(thisVendor)),
    );
  }
}
