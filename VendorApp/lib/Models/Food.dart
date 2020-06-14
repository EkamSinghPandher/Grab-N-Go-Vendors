import 'package:json_annotation/json_annotation.dart';

part 'food.g.dart';

@JsonSerializable()
class Food{
  String uid;
  String foodImage;
  String foodName;
  int foodPrice;
  int stock;

  Food({this.uid, this.foodImage, this.foodName, this.foodPrice, this.stock});

  factory Food.fromJson(Map<String, dynamic> json) =>_$FoodFromJson(json);
  Map<String, dynamic> toJson() => _$FoodToJson(this);
}