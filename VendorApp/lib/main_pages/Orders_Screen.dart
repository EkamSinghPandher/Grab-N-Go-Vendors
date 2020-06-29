import 'package:VendorApp/main_pages/topBar.dart';
import 'package:flutter/material.dart';

class OrderScreen extends StatefulWidget {
  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topBar(context, null),
      body: SafeArea(
        child: Center(
          child: Text('This is pending Orders Page'),
        ),
      ),
    );
  }
}
