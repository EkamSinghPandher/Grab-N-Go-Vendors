import 'package:VendorApp/Services/auth.dart';
import 'package:VendorApp/Services/database.dart';
import 'package:VendorApp/main_pages/HomeScreen/ImageCapture.dart';
import 'package:VendorApp/main_pages/topBar.dart';
import 'package:flutter/material.dart';
import 'package:VendorApp/Models/Vendor.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  static Vendor user;
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    Vendor vendor = Provider.of<Vendor>(context);
    String stallImage = vendor == null ? 'nothing' : vendor.stallImage;
    return Scaffold(
      appBar: topBar(context, null),
      body: Center(
        child: vendor == null
            ? CircularProgressIndicator()
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton(
                    child: Text('sign out'),
                    onPressed: () async {
                      _auth.signOut();
                    },
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  FlatButton(
                    color: Colors.grey,
                    onPressed: () {
                      setState(() async {
                        stallImage = await Navigator.push(
                          context,
                          new MaterialPageRoute(
                            builder: (context) => ImageCapture(
                              vendor: vendor,
                              foodID: 'stall image',
                            ),
                          ),
                        );
                        await DataService().updateVendorData(new Vendor(
                          loc: vendor.loc,
                          uid: vendor.uid,
                          stallName: vendor.stallName,
                          stallImage: stallImage,
                          email: vendor.email,
                          phoneNumber: vendor.phoneNumber,
                        ));
                        DataService().updateLocationData(new Vendor(
                          loc: vendor.loc,
                          uid: vendor.uid,
                          stallName: vendor.stallName,
                          stallImage: stallImage,
                          email: vendor.email,
                          phoneNumber: vendor.phoneNumber,
                        ));
                      });
                    },
                    child: Text(
                      "change stall image",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
      ),
      //body:ProfileScreenLayout(vendor: ProfileScreen.user, height: height, width: width,)
    );
  }
}
