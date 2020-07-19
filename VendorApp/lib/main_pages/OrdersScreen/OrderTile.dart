import 'package:VendorApp/Models/Order.dart';
import 'package:VendorApp/Services/database.dart';
import 'package:flutter/material.dart';

class OrderTile extends StatelessWidget {
  final Order order;

  const OrderTile({Key key, this.order}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(order.orderID.toString()),
      subtitle: Text(order.dateTime.toIso8601String()),
      onTap: () {},
      trailing: IconButton(
          icon: Icon(Icons.check_box),
          onPressed: () {
            DataService().doneOrder(order);
          }),
    );
  }
}
