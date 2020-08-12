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
      openingHour: Vendor.doubleToTimeOfDay(json['openingHour']),
      closingHour: Vendor.doubleToTimeOfDay(json['closingHour']));
}

Map<String, dynamic> _$VendorToJson(Vendor instance) => <String, dynamic>{
      'loc': instance.loc,
      'uid': instance.uid,
      'stallName': instance.stallName,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'stallImage': instance.stallImage,
      'openingHour': Vendor.timeOfDayToDouble(instance.openingHour),
      'closingHour': Vendor.timeOfDayToDouble(instance.closingHour)
    };
