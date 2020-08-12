import 'package:flutter/material.dart';
import 'package:VendorApp/Models/Food.dart';
import './foodTile.dart';

class FoodCard extends StatelessWidget {
  final double height;
  final double width;
  final List<Food> menu;
  const FoodCard(this.height, this.menu, this.width);

  @override
  Widget build(BuildContext context) {
    List<FoodTile> tiles =
        menu.map((food) => FoodTile(food, height * 0.3, width)).toList();
    return Container(
      height: height,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemBuilder: (ctx, index) {
          return tiles[index];
        },
        itemCount: tiles.length,
      ),
    );
  }
}
