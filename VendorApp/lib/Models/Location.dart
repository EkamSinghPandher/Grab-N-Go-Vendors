import 'package:json_annotation/json_annotation.dart';

part 'location.g.dart';

@JsonSerializable()
class Location{
  final String name;
  final String location;

  Location({this.name, this.location});

  factory Location.fromJson(Map<String, dynamic> json) =>_$LocationFromJson(json);
  Map<String, dynamic> toJson() => _$LocationToJson(this);
}