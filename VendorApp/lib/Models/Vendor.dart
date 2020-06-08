import './Food.dart';

class Vendor {
  String uid;
  List<Food> menu;
  String stallName;
  String email;
  int phoneNumber;
  String stallImage;

  Vendor(
      {this.uid,
      this.menu,
      this.stallName,
      this.email,
      this.phoneNumber,
      this.stallImage});

}
