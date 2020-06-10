// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Food _$FoodFromJson(Map<String, dynamic> json) {
  return Food(
    uid: json['uid'] as String,
    foodImage: json['foodImage'] as String,
    foodName: json['foodName'] as String,
    foodPrice: json['foodPrice'] as int,
    stock: json['stock'] as int,
  );
}

Map<String, dynamic> _$FoodToJson(Food instance) => <String, dynamic>{
      'uid': instance.uid,
      'foodImage': instance.foodImage,
      'foodName': instance.foodName,
      'foodPrice': instance.foodPrice,
      'stock': instance.stock,
    };
