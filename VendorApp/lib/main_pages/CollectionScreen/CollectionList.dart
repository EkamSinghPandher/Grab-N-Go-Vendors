import 'package:VendorApp/Models/Order.dart';
import 'package:VendorApp/main_pages/CollectionScreen/CollectionTile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CollectionList extends StatefulWidget {
  @override
  _CollectionListState createState() => _CollectionListState();
}

class _CollectionListState extends State<CollectionList> {
  @override
  Widget build(BuildContext context) {
    List<Order> orderList = Provider.of<List<Order>>(context);
    List<Order> sorter = orderList == null
        ? []
        : orderList.where((element) => element.isDone == true).toList();
    sorter.sort((a, b) => a.dateTime.compareTo(b.dateTime));
    List<CollectionTile> tiles =
        sorter.map((e) => CollectionTile(order: e)).toList();
    return Container(
        height: 400,
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            return tiles[index];
          },
          itemCount: tiles.length,
        ));
  }
}
