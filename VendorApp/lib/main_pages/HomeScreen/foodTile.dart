import 'package:VendorApp/Models/Food.dart';
import 'package:flutter/material.dart';

class FoodTile extends StatelessWidget {
  final Food food;
  final double height;

  const FoodTile(this.food, this.height);

  @override
  Widget build(BuildContext context) {
    return Card(
            elevation: 1,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            margin: EdgeInsets.fromLTRB(13, 8, 13, 7),
            child: Container(
                height: height * 0.1,
                width: 300,
                alignment: Alignment.centerLeft,
                child: ListTile(
                    leading: Container(
                  height: height * 0.09,
                  width: 300,
                  child: Row(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(3),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: 
                              food.foodImage,
                            ),
                      ),
                      SizedBox(width: 18),
                      Text(food.foodName)
                    ],
                  ),
                ))));
  }
}