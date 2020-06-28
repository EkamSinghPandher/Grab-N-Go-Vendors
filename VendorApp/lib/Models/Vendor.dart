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

  Vendor(
      {this.loc,
      this.uid,
      this.stallName,
      this.email,
      this.phoneNumber,
      this.stallImage});

  factory Vendor.fromJson(Map<String, dynamic> json) => _$VendorFromJson(json);
  Map<String, dynamic> toJson() => _$VendorToJson(this);
}
