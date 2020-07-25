// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Order _$OrderFromJson(Map<String, dynamic> json) {
  return Order(
      vendorUID: json['vendorUID'] as String,
      studentUID: json['studentUID'] as String,
      dateTime: json['dateTime'] == null
          ? null
          : DateTime.parse(json['dateTime'] as String),
      foodName: json['foodName'] as String,
      orderID: json['orderID'] as String,
      foodPrice: json['foodPrice'] as int,
      quantity: json['quantity'] as int,
      isDone: json['isDone'] as bool,
      isCollected: json['isCollected'] as bool,
      orderImage: json['orderImage'] as String);
}

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
      'vendorUID': instance.vendorUID,
      'studentUID': instance.studentUID,
      'dateTime': instance.dateTime?.toIso8601String(),
      'foodName': instance.foodName,
      'orderID': instance.orderID,
      'foodPrice': instance.foodPrice,
      'quantity': instance.quantity,
      'isDone': instance.isDone,
      'isCollected': instance.isCollected,
      'orderImage': instance.orderImage
    };
