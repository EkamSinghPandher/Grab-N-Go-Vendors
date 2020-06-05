import 'package:VendorApp/main_pages/history_screen.dart';
import 'package:VendorApp/main_pages/HomeScreen/home_screen.dart';
import 'package:VendorApp/main_pages/ProfileScreen/profile_screen.dart';
import 'package:VendorApp/main_pages/shop_screen.dart';
import 'package:flutter/material.dart';

class PageLogic extends StatefulWidget {
  static const String id = 'page_logic';
  @override
  _PageLogicState createState() => _PageLogicState();
}

class _PageLogicState extends State<PageLogic> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    HomeScreen(),
    ShopScreen(),
    HistoryScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            icon: Icon(Icons.shopping_basket),
            title: Text('Orders'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.speaker_notes),
            title: Text('Chat'),
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
    );
  }
}
