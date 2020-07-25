import 'package:VendorApp/Models/Food.dart';
import 'package:VendorApp/Models/User.dart';
import 'package:VendorApp/Services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './ScreenLayout.dart';

class HomeScreen extends StatelessWidget {
  static const String id = 'home_screen';
  Widget build(BuildContext context) {
    final User user = Provider.of<User>(context);
    return StreamProvider<List<Food>>(
      create: (_) => DataService(uid: user.uid).menuFromVendor(),
      child: Scaffold(
        body: Container(child: HomeScreenLayout()),
      ),
    );
  }
}
