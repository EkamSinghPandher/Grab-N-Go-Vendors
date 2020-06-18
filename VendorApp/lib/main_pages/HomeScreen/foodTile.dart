import 'package:VendorApp/Models/Food.dart';
import 'package:VendorApp/Models/Vendor.dart';
import 'package:VendorApp/Services/database.dart';
import 'package:VendorApp/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FoodTile extends StatefulWidget {
  final Food food;
  final double height;

  const FoodTile(this.food, this.height);

  @override
  _FoodTileState createState() => _FoodTileState();
}

class _FoodTileState extends State<FoodTile> {
  @override
  Widget build(BuildContext context) {
    Vendor vendor = Provider.of<Vendor>(context);
    return Card(
          color: Colors.blue[100],
          borderOnForeground: true,
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          margin: EdgeInsets.fromLTRB(10, 5, 13, 7),
          child: Container(
              height: widget.height * 0.1,
              width: 300,
              alignment: Alignment.centerLeft,
              child: ListTile(
                  trailing: IconButton(
                    icon: Icon(
                      Icons.edit,
                      color: Colors.blueGrey,
                    ),
                    onPressed: () {
                      return buildShowDialog(context, widget.food.foodName, widget.food.foodPrice, widget.food.stock, vendor, widget.food.uid);
                    },
                  ),
                  leading: Container(
                    height: widget.height * 0.09,
                    width: 280,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(3),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: Image.network(widget.food.foodImage),
                          ),
                        ),
                        Text(widget.food.foodName),
                        Text('\$' + (widget.food.foodPrice / 100).toString()),
                        Text((widget.food.stock).toString())
                      ],
                    ),
                  )))
    );
  }

  buildShowDialog(BuildContext context, String foodname, int foodPrice,
      int foodStock, Vendor vendor, String uid) async {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Edit your menu'),
            content: Column(children: [
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
                initialValue: (foodPrice/100).toString(),
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
            ]),
            actions: <Widget>[
              FlatButton(
                child: Text('Done'),
                onPressed: () async {
                  await DataService().updateMenu(
                      vendor,
                      Food(
                          uid: uid,
                          foodImage: vendor.stallImage,
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
