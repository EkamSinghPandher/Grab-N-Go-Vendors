import 'package:VendorApp/Models/Food.dart';
import 'package:VendorApp/Models/Vendor.dart';
import 'package:VendorApp/Services/database.dart';
import 'package:VendorApp/components/dialogconsts.dart';
import 'package:VendorApp/main_pages/HomeScreen/ImageCapture.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FoodTile extends StatefulWidget {
  final Food food;
  final double width;
  final double height;

  const FoodTile(this.food, this.height, this.width);

  @override
  _FoodTileState createState() => _FoodTileState();
}

class _FoodTileState extends State<FoodTile> {
  @override
  Widget build(BuildContext context) {
    Vendor vendor = Provider.of<Vendor>(context);
    return Container(
      height: widget.height,
      width: widget.width,
      child: Column(
        children: <Widget>[
          Container(
            height: widget.height * 0.8,
            width: widget.width * 0.9,
            child: Row(
              children: <Widget>[
                Container(
                  height: widget.height * 0.60,
                  width: widget.width * 0.28,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(7),
                    child: Image.network(
                      widget.food.foodImage,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 2, 0, 2),
                  height: widget.height * 0.6,
                  width: widget.width * 0.38,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        widget.food.foodName,
                        style: TextStyle(
                            fontSize: 15,
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w500),
                      ),
                      Text("Stock: ${widget.food.stock.toString()}",
                          style: TextStyle(
                              fontSize: 12,
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.w400)),
                      Text(
                          "Price: \$${(widget.food.foodPrice / 100).toStringAsFixed(2)}",
                          style: TextStyle(
                              fontSize: 12,
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.w400))
                    ],
                  ),
                ),
                Container(
                  height: widget.height * 0.75,
                  width: widget.width * 0.2,
                  child: Column(
                    children: <Widget>[
                      IconButton(
                          icon: Icon(
                            Icons.edit,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            return buildShowDialog(
                                context,
                                widget.food.foodName,
                                widget.food.foodPrice,
                                widget.food.stock,
                                vendor,
                                widget.food.uid,
                                widget.food.foodImage);
                          }),
                      IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          return buildAlertDialog(context, widget.food, vendor);
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

  buildShowDialog(BuildContext context, String foodname, int foodPrice,
      int foodStock, Vendor vendor, String uid, String foodImage) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          title: Text(
            'Edit your menu',
            textAlign: TextAlign.center,
          ),
          content: SingleChildScrollView(
            child: Column(children: [
              TextFormField(
                initialValue: foodname,
                validator: (val) => val.isEmpty ? 'Enter your Food Name' : null,
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
                initialValue: (foodPrice / 100).toString(),
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
                initialValue: foodStock.toString(),
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
                          foodID: uid,
                        ),
                      ),
                    );
                  });
                },
                icon: Icon(Icons.image),
                label: Text('Edit Image'),
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
                        uid: uid,
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
      },
    );
  }

  buildAlertDialog(BuildContext context, Food food, Vendor vendor) async {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            title: Text(
              "Are you sure you want to delete this item from the menu?",
              textAlign: TextAlign.center,
            ),
            content: Container(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                FlatButton(
                    child: Text('Yes'),
                    onPressed: () async {
                      await DataService().deleteFood(food, vendor);
                      Navigator.of(context).pop();
                    }),
                FlatButton(
                  child: Text('No'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            )),
          );
        });
  }
}
