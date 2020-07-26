import 'package:VendorApp/Models/Order.dart';
import 'package:VendorApp/main_pages/OrdersScreen/OrderTile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderList extends StatefulWidget {
  final double height;
  final double width;

  const OrderList({Key key, this.height, this.width}) : super(key: key);
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
    List<OrderTile> tiles = sorter
        .map((e) => OrderTile(
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
                'No orders pending',
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
