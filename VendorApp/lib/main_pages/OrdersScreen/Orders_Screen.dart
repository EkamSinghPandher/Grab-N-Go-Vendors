import 'package:VendorApp/main_pages/OrdersScreen/OrderList.dart';
import 'package:VendorApp/main_pages/topBar.dart';
import 'package:flutter/material.dart';

class OrderScreen extends StatefulWidget {
  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: height,
        child: Container(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(0, 45, 0, 10),
                child: FittedBox(
                  child: Text(
                    'Orders pending',
                    style: TextStyle(
                      color: Colors.blue.shade800,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w500,
                      fontSize: 30.0,
                    ),
                  ),
                  fit: BoxFit.fitHeight,
                ),
                height: height * 0.05,
              ),
              OrderList(
                width: width,
                height: height * 0.79,
              )
            ],
          ),
        ),
      ),
    );
  }
}
