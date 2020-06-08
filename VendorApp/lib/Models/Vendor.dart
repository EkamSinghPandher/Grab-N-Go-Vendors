import './Food.dart';
import './Location.dart';
import 'package:flutter/material.dart';

class Vendor{
  List<Food> menu;
  Location location;
  String stallName;
  String email;
  String password;
  int phoneNumber;
  String stallImage;

  Vendor({this.menu, this.location, this.stallName, this.email, this.password, this.phoneNumber, this.stallImage});
}