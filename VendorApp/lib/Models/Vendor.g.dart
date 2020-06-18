// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Vendor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Vendor _$VendorFromJson(Map<String, dynamic> json) {
  return Vendor(
    loc: json['loc'] as String,
    uid: json['uid'] as String,
    stallName: json['stallName'] as String,
    email: json['email'] as String,
    phoneNumber: json['phoneNumber'] as int,
    stallImage: json['stallImage'] as String,
  );
}

Map<String, dynamic> _$VendorToJson(Vendor instance) => <String, dynamic>{
      'loc': instance.loc,
      'uid': instance.uid,
      'stallName': instance.stallName,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'stallImage': instance.stallImage,
    };
