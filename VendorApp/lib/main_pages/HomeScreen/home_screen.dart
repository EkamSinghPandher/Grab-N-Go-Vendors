import 'package:VendorApp/Models/User.dart';
import 'package:VendorApp/Services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './ScreenLayout.dart';
import 'package:VendorApp/Models/Vendor.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'home_screen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<User>(context);
    return StreamProvider<Vendor>.value(
      value: DataService(uid: user.uid).vendors,
      child: Scaffold(
        body: Container(child: HomeScreenLayout()),
      ),
    );
  }
}
