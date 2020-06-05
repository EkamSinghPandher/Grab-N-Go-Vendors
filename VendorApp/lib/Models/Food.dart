import 'package:flutter/material.dart';
class Food{
  int id;
  Image foodImage;
  String foodName;
  int foodPrice;
  int stock;

  Food({String foodName, int foodPrice, Image foodImage, int stock, int id}){
    this.id = id;
    this.foodImage = foodImage;
    this.foodName = foodName;
    this.foodPrice = foodPrice;
    this.stock = stock;
  }
}