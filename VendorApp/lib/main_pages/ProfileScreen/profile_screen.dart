import 'package:flutter/material.dart';
import 'package:VendorApp/Models/Vendor.dart';
import 'package:VendorApp/Models/Food.dart';
import 'package:VendorApp/Models/Location.dart';


class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
    );
  }
}
