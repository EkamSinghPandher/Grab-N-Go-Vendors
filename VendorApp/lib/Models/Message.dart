import 'package:json_annotation/json_annotation.dart';

part 'Message.g.dart';

@JsonSerializable()
class Message {
  final String text;
  final String studentID;
  final String vendorID;
  final String sendorID;
  final DateTime time;

  Message({
    this.time,
    this.text,
    this.studentID,
    this.vendorID,
    this.sendorID,
  });

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);
  Map<String, dynamic> toJson() => _$MessageToJson(this);
}
