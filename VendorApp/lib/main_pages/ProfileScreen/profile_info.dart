import 'package:flutter/material.dart';
import 'package:VendorApp/Models/Vendor.dart';

class ProfileInfo extends StatelessWidget {
  final double height;
  final double width;
  final Vendor vendor;

  ProfileInfo({this.height, this.width, this.vendor});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(15, 10, 0, 0),
        height: height * 0.5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Stall Name:    ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(vendor.stallName)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Email:    ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(vendor.email)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Phone Number:    ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(vendor.phoneNumber.toString())
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Location:    ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text('Utown')
              ],
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 70, 20, 0),
              height: height*0.05,
              child: FloatingActionButton(
                backgroundColor: Colors.lightBlue,
                onPressed: null,
                child: Icon(Icons.edit),
              ),
              alignment: Alignment.bottomRight,)
          ],
        ));
  }
}
