import 'package:VendorApp/Models/Order.dart';
import 'package:VendorApp/Services/database.dart';
import 'package:VendorApp/main_pages/OrdersScreen/messagesScreen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OrderTile extends StatelessWidget {
  final Order order;
  final double height;
  final double width;

  const OrderTile({Key key, this.order, this.height, this.width})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: Column(
        children: <Widget>[
          Container(
            height: height * 0.8,
            width: width * 0.9,
            child: Row(
              children: <Widget>[
                Container(
                  height: height * 0.60,
                  width: width * 0.28,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(7),
                    child: Image.network(
                      order.orderImage,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 2, 0, 2),
                  height: height * 0.6,
                  width: width * 0.38,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Order: ${order.orderID}",
                          style: TextStyle(
                              fontSize: 17,
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.w600)),
                      Text(
                        "x${order.quantity.toString()} ${order.foodName}",
                        style: TextStyle(
                            fontSize: 11,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w300),
                      ),
                      Text(
                          "Cost: \$${(order.foodPrice / 100).toStringAsFixed(2)}",
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.w400)),
                      Text(
                          "Time: ${DateFormat('HH:mm').format(order.dateTime)}",
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.w400))
                    ],
                  ),
                ),
                Container(
                  height: height * 0.75,
                  width: width * 0.2,
                  child: Column(
                    children: <Widget>[
                      IconButton(
                          icon: Icon(
                            Icons.check,
                            color: Colors.green,
                          ),
                          onPressed: () {
                            DataService().doneOrder(order);
                          }),
                      IconButton(
                        icon: Icon(Icons.message, color: Colors.blueGrey),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => ChatScreen(
                                        order: order,
                                      )));
                        },
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Divider(
            color: Colors.black,
            endIndent: 22,
            indent: 22,
            thickness: 0.7,
          )
        ],
      ),
    );
  }
}
