import 'package:flutter/material.dart';
import 'package:VendorApp/Models/Food.dart';
import './foodTile.dart';

class FoodCard extends StatelessWidget {
  final double height;
  final List<Food> menu;
  const FoodCard(this.height, this.menu);

  @override
  Widget build(BuildContext context) {
    List<FoodTile> tiles = menu.map((food) => FoodTile(food, height)).toList();
    return Container(
      height: height * 0.528,
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return tiles[index];
        },
        itemCount: tiles.length,
      ),
    );
  }
}
