import 'package:VendorApp/Services/auth.dart';
import 'package:flutter/material.dart';
import 'package:VendorApp/Models/Vendor.dart';

class ProfileScreen extends StatefulWidget {
  static Vendor user;
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _auth = AuthService();
  
  @override
  Widget build(BuildContext context) {
    //double width = MediaQuery.of(context).size.width;
   // double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: FloatingActionButton(child: Text('sign out'), onPressed: () async{
          _auth.signOut();
        },),
      ),
      //body:ProfileScreenLayout(vendor: ProfileScreen.user, height: height, width: width,)
    );
  }
}
