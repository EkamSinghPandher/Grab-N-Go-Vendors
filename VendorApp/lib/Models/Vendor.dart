import './Food.dart';
import 'location.dart';
import 'package:json_annotation/json_annotation.dart';

part 'vendor.g.dart';

@JsonSerializable()
class Vendor {
  final Location loc;
  final String uid;
  final List<Food> menu;
  final String stallName;
  final String email;
  final int phoneNumber;
  final String stallImage;

  Vendor(
      {this.loc,
      this.uid,
      this.menu,
      this.stallName,
      this.email,
      this.phoneNumber,
      this.stallImage});

  factory Vendor.fromJson(Map<String, dynamic> json) => _$VendorFromJson(json);
  Map<String, dynamic> toJson() => _$VendorToJson(this);
}
