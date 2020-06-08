import 'package:VendorApp/Models/Food.dart';
import 'package:VendorApp/Models/Vendor.dart';
import 'package:flutter/material.dart';

List<Food> menu = [
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
      id: 0),
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
  stallName: 'Xiao Long Bao Stall',
  email: 'dummyemail',
  phoneNumber: 999,
  menu: menu,
  stallImage: 'images/shop-image.jpg',
);
