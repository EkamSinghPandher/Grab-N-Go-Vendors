import 'package:VendorApp/Models/Food.dart';
import 'package:VendorApp/Services/database.dart';
import 'package:VendorApp/components/constants.dart';
import 'package:VendorApp/main_pages/HomeScreen/ImageCapture.dart';
import 'package:provider/provider.dart';

import './food_cards.dart';
import 'package:flutter/material.dart';
import './ImageTitle.dart';
import 'package:VendorApp/Models/Vendor.dart';

class HomeScreenLayout extends StatefulWidget {
  @override
  _HomeScreenLayoutState createState() => _HomeScreenLayoutState();
}

class _HomeScreenLayoutState extends State<HomeScreenLayout> {
  String foodname = '';
  int foodprice;
  int foodstock;
  @override
  Widget build(BuildContext context) {
    List<Food> menu = Provider.of<List<Food>>(context);
    Vendor vendor = Provider.of<Vendor>(context);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: vendor == null
          ? CircularProgressIndicator()
          : SingleChildScrollView(
              child: Column(children: [
                ImageTitle(
                  height * 0.35,
                  width,
                ),
                Stack(alignment: Alignment.bottomRight, children: [
                  FoodCard(height * 0.64, menu == null ? [] : menu, width),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 15, 15),
                    alignment: Alignment.centerRight,
                    child: FloatingActionButton(
                      backgroundColor: Colors.amber,
                      elevation: 0,
                      child: Icon(Icons.add),
                      onPressed: () {
                        return buildShowDialog(
                            context, foodname, foodprice, foodstock, vendor);
                      },
                    ),
                  )
                ]),
              ]),
            ),
    );
  }

  buildShowDialog(BuildContext context, String foodname, int foodPrice,
      int foodStock, Vendor vendor) async {
    String foodUID = DateTime.now().toString();
    String foodImage =
        'https://res.cloudinary.com/hkf2ycaep/image/fetch/d_project-placeholder.png,f_auto/https:/assets/project-placeholder-b90804f0a659d3f283c62d185d49635da22a5b8bbfb7e985f0d0390201f9d2b1.png';
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              'Add food your menu',
            ),
            content: SingleChildScrollView(
              child: Column(children: [
                TextFormField(
                  validator: (val) =>
                      val.isEmpty ? 'Enter your Food Name' : null,
                  onChanged: (value) {
                    setState(() {
                      foodname = value;
                    });
                  },
                  decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Enter Your Foods Name',
                  ),
                ),
                SizedBox(height: 5),
                TextFormField(
                  keyboardType: TextInputType.numberWithOptions(),
                  validator: (val) =>
                      val == null ? 'Enter your Foods Price' : null,
                  onChanged: (value) {
                    setState(() {
                      foodPrice = (double.parse(value) * 100).round();
                    });
                  },
                  decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Enter your Foods Price',
                  ),
                ),
                SizedBox(height: 5),
                TextFormField(
                  keyboardType: TextInputType.numberWithOptions(),
                  validator: (val) =>
                      val == null ? 'Enter your Foods Stock' : null,
                  onChanged: (value) {
                    setState(() {
                      foodStock = int.parse(value);
                    });
                  },
                  decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Enter your Foods Stock',
                  ),
                ),
                SizedBox(height: 5),
                FlatButton.icon(
                  onPressed: () {
                    setState(() async {
                      foodImage = await Navigator.push(
                        context,
                        new MaterialPageRoute(
                          builder: (context) => ImageCapture(
                            vendor: vendor,
                            foodID: foodUID,
                          ),
                        ),
                      );
                    });
                  },
                  icon: Icon(Icons.image),
                  label: Text('Upload Image'),
                ),
              ]),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Done'),
                onPressed: () {
                  DataService().updateMenu(
                      vendor,
                      Food(
                          uid: foodUID,
                          foodImage: foodImage,
                          foodName: foodname,
                          foodPrice: foodPrice,
                          stock: foodStock));
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                child: Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }
}
