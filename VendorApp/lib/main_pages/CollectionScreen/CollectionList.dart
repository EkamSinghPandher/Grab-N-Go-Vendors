import 'package:VendorApp/Models/Order.dart';
import 'package:VendorApp/main_pages/CollectionScreen/CollectionTile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CollectionList extends StatefulWidget {
  final double height;
  final double width;

  const CollectionList({Key key, this.height, this.width}) : super(key: key);
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
    List<CollectionTile> tiles = sorter
        .map((e) => CollectionTile(
              order: e,
              height: widget.height * 0.28,
              width: widget.width,
            ))
        .toList();
    return Container(
        alignment: tiles.isEmpty ? Alignment.center : Alignment.topCenter,
        height: widget.height,
        child: tiles.isEmpty
            ? Text(
                'No collections pending',
                style: TextStyle(
                    color: Colors.grey,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w300,
                    fontSize: 24),
              )
            : ListView.builder(
                itemBuilder: (ctx, index) {
                  return tiles[index];
                },
                itemCount: tiles.length,
              ));
  }
}
