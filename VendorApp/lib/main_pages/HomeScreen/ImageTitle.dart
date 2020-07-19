import 'package:VendorApp/Models/Food.dart';
import 'package:VendorApp/Models/Vendor.dart';
import 'package:VendorApp/Services/database.dart';
import 'package:VendorApp/components/constants.dart';
import 'package:VendorApp/main_pages/HomeScreen/ImageCapture.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ImageTitle extends StatefulWidget {
  //Creates the Image and title stack of the vendors homepage
  final double height;
  final double width;
  final Image image;

  const ImageTitle(this.height, this.width, this.image);

  @override
  _ImageTitleState createState() => _ImageTitleState();
}

class _ImageTitleState extends State<ImageTitle> {
  @override
  Widget build(BuildContext context) {
    final Vendor vendor = Provider.of<Vendor>(context);
    String foodname = '';
    // ignore: avoid_init_to_null
    int foodPrice = null;
    // ignore: avoid_init_to_null
    int foodStock = null;
    return vendor == null
        ? CircularProgressIndicator()
        : Container(
            height: widget.height * 0.33,
            child: Stack(
              children: <Widget>[
                Container(
                    height: widget.height * 0.33,
                    width: double.infinity,
                    child: widget.image),
                Positioned(
                  width: widget.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        height: 80,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.fromLTRB(15, 10, 10, 3),
                              child: Text(vendor.stallName,
                                  style: TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Montserrat",
                                      color: Colors.white)),
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(16, 0, 10, 10),
                              child: Text(vendor.loc,
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                    fontFamily: "Montserrat",
                                  )),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: widget.height * 0.06,
                        margin: EdgeInsets.fromLTRB(0, 16, 0, 0),
                        child: FloatingActionButton(
                          child: Icon(Icons.add),
                          backgroundColor: Colors.lightBlue,
                          onPressed: () async {
                            return await buildShowDialog(context, foodname,
                                foodPrice, foodStock, vendor);
                          },
                        ),
                      )
                    ],
                  ),
                  bottom: 5,
                  left: 0,
                )
              ],
            ),
          );
  }

  //builds the popup for the addition of food items (needs ui improvements)
  buildShowDialog(BuildContext context, String foodname, int foodPrice,
      int foodStock, Vendor vendor) async {
    String foodUID = DateTime.now().toString();
    String foodImage =
        'https://res.cloudinary.com/hkf2ycaep/image/fetch/d_project-placeholder.png,f_auto/https:/assets/project-placeholder-b90804f0a659d3f283c62d185d49635da22a5b8bbfb7e985f0d0390201f9d2b1.png';
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Add your food to the menu'),
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
                onPressed: () async {
                  await DataService().updateMenu(
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
