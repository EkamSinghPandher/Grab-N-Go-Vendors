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
  final bool isCollected;
  final String orderImage;
  final String stallName;
  final String studName;

  Order(
      {this.stallName,
      this.studName,
      this.orderImage,
      this.vendorUID,
      this.studentUID,
      this.dateTime,
      this.foodName,
      this.orderID,
      this.foodPrice,
      this.quantity,
      this.isDone,
      this.isCollected});

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);
  Map<String, dynamic> toJson() => _$OrderToJson(this);

  Order collectedOrder() {
    return Order(
        stallName: this.stallName,
        studName: this.studName,
        orderImage: this.orderImage,
        dateTime: this.dateTime,
        vendorUID: this.vendorUID,
        studentUID: this.studentUID,
        foodName: this.foodName,
        orderID: this.orderID,
        foodPrice: this.foodPrice,
        quantity: this.quantity,
        isDone: this.isDone,
        isCollected: true);
  }

  Order doneOrder() {
    return Order(
        stallName: this.stallName,
        studName: this.studName,
        orderImage: this.orderImage,
        dateTime: this.dateTime,
        vendorUID: this.vendorUID,
        studentUID: this.studentUID,
        foodName: this.foodName,
        orderID: this.orderID,
        foodPrice: this.foodPrice,
        quantity: this.quantity,
        isDone: true,
        isCollected: this.isCollected);
  }
}
