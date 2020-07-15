import 'package:VendorApp/main_pages/CollectionScreen/CollectionList.dart';
import 'package:VendorApp/main_pages/topBar.dart';
import 'package:flutter/material.dart';

class CollectionScreen extends StatefulWidget {
  @override
  _CollectionScreenState createState() => _CollectionScreenState();
}

class _CollectionScreenState extends State<CollectionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topBar(context, null),
      body: Container(
        child: Column(
          children: [Text('Orders Waiting to be collected'), CollectionList()],
        ),
      ),
    );
  }
}
