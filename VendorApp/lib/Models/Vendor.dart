import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'Vendor.g.dart';

@JsonSerializable()
class Vendor {
  final String loc;
  final String uid;
  final String stallName;
  final String email;
  final int phoneNumber;
  final String stallImage;
  final TimeOfDay openingHour;
  final TimeOfDay closingHour;

  Vendor(
      {this.loc,
      this.uid,
      this.stallName,
      this.email,
      this.phoneNumber,
      this.stallImage,
      @required this.openingHour,
      this.closingHour});

  static double timeOfDayToDouble(TimeOfDay time) {
    return time.hour + time.minute / 60;
  }

  static TimeOfDay doubleToTimeOfDay(double doub) {
    return TimeOfDay(
        hour: (doub - (doub % 1)).floor(), minute: ((doub % 1) * 60).floor());
  }

  factory Vendor.fromJson(Map<String, dynamic> json) => _$VendorFromJson(json);
  Map<String, dynamic> toJson() => _$VendorToJson(this);
}
