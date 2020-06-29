import 'package:VendorApp/Models/Order.dart';
import 'package:VendorApp/main_pages/OrdersScreen/OrderTile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderList extends StatefulWidget {
  @override
  _OrderListState createState() => _OrderListState();
}

class _OrderListState extends State<OrderList> {
  @override
  Widget build(BuildContext context) {
    List<Order> orderList = Provider.of<List<Order>>(context);
    List<Order> sorter = orderList == null
        ? []
        : orderList
            .where((element) =>
                element.isDone == false && element.isCollected == false)
            .toList();
    sorter.sort((a, b) => a.dateTime.compareTo(b.dateTime));
    List<OrderTile> tiles = sorter.map((e) => OrderTile(order: e)).toList();
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
