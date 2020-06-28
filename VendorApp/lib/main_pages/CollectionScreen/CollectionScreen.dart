import 'package:VendorApp/Models/Order.dart';
import 'package:VendorApp/Models/User.dart';
import 'package:VendorApp/Services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CollectionScreen extends StatefulWidget {
  @override
  _CollectionScreenState createState() => _CollectionScreenState();
}

class _CollectionScreenState extends State<CollectionScreen> {
  bool isCurrent = true;
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Order>>(
      create: (_) => DataService(uid: Provider.of<User>(context).uid).myOrders,
          child: Scaffold(
        appBar: AppBar(
          leading: null,
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  //Implement logout functionality
                }),
          ],
          title: Text('Collection'),
          backgroundColor: Colors.lightBlueAccent,
        ),
        body: SafeArea(
          child: Container()
        ),
      ),
    );
  }
}