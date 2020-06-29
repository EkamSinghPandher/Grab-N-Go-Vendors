import 'package:VendorApp/Models/User.dart';
import 'package:VendorApp/Models/Vendor.dart';
import 'package:VendorApp/Services/database.dart';
import 'package:VendorApp/main_pages/HomeScreen/home_screen.dart';
import 'package:VendorApp/main_pages/CollectionScreen/CollectionScreen.dart';
import 'package:VendorApp/main_pages/Orders_Screen.dart';
import 'package:VendorApp/main_pages/ProfileScreen/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PageLogic extends StatefulWidget {
  static const String id = 'page_logic';
  @override
  _PageLogicState createState() => _PageLogicState();
}

class _PageLogicState extends State<PageLogic> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    HomeScreen(),
    OrderScreen(),
    CollectionScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return StreamProvider<Vendor>(
        create: (_) => DataService().vendors,
        child: StreamProvider<Vendor>(
          create: (_) =>
              DataService(uid: Provider.of<User>(context).uid).vendors,
          child: Scaffold(
            body: _children[_currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: _currentIndex,
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  title: Text('Home'),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.assignment),
                  title: Text('Orders'),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_basket),
                  title: Text('Collection'),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  title: Text('Profile'),
                ),
              ],
              onTap: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
          ),
        ));
  }
}
