import 'package:VendorApp/Models/Vendor.dart';
import 'package:VendorApp/main_pages/loginScreen/welcome_screen.dart';
import 'package:VendorApp/main_pages/page_logic.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatefulWidget {
  static const id = 'Wrapper_screen';
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    final Vendor user = Provider.of<Vendor>(context);
    return user == null ? WelcomeScreen() : PageLogic();
  }
}