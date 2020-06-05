import 'package:flutter/material.dart';
import 'package:VendorApp/Models/Vendor.dart';
import './ImageTitle.dart';
import './profile_info.dart';

class ProfileScreenLayout extends StatelessWidget {
  final Vendor vendor;
  final double height;
  final double width;
  const ProfileScreenLayout({this.vendor, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: <Widget>[
            ImageTitle(
                width,
                height,
                vendor.stallName,
                Image.asset(
                  vendor.stallImage,
                  fit: BoxFit.fill,
                  color: Colors.black45,
                  colorBlendMode: BlendMode.darken,
                )),
            ProfileInfo(vendor: vendor, height: height, width: width)
          ],
        ));
  }
}
