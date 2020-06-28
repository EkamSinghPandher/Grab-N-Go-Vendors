import 'package:json_annotation/json_annotation.dart';

part 'Order.g.dart';

@JsonSerializable()
class Order {
  final String vendorUID;
  final String studentUID;
  final DateTime dateTime;
  final String foodName;
  final String orderID;
  final int foodPrice;
  final int quantity;
  final bool isDone;

  Order(
      {this.vendorUID,
      this.studentUID,
      this.dateTime,
      this.foodName,
      this.orderID,
      this.foodPrice,
      this.quantity,
      this.isDone});

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);
  Map<String, dynamic> toJson() => _$OrderToJson(this);
}
