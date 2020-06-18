import 'package:VendorApp/Models/Food.dart';
import 'package:VendorApp/Models/Vendor.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class DataService{

  final String uid;

  DataService({this.uid});

  //collection references
  final CollectionReference vendorsCollection = Firestore.instance.collection('Vendors');
  final CollectionReference locationsCollection = Firestore.instance.collection('LocationList');

  //updating vendor data
  Future updateVendorData(Vendor vendor) async{
    return await vendorsCollection.document(vendor.uid).setData(vendor.toJson());
  }

  //updating location data
  Future updateLocationData(Vendor vendor) async{
    return locationsCollection.document(vendor.loc).collection('Stalls').document(vendor.uid).setData(vendor.toJson());
  }

  //Add/edit food to menu
  Future updateMenu(Vendor  vendor, Food food) async{
    await vendorsCollection.document(vendor.uid).collection('Menu').document(food.uid).setData(food.toJson());
    return locationsCollection.document(vendor.loc).collection('Stalls').document(vendor.uid).collection('Menu').document(food.uid).setData(food.toJson());
  }
  
  //get vendor stream
  Stream<Vendor> get vendors{
    return vendorsCollection.snapshots().map(vendorFromSnapshot);
  }

  //get List of Vendors
  Vendor vendorFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc){
      return Vendor.fromJson((doc.data));
    }).toList().firstWhere((element) => element.uid == this.uid);
  }

  //get menu from a vendor
  Stream<List<Food>> menuFromVendor(){
    return vendorsCollection.document(uid).collection('Menu').snapshots().map(menuFromSnapshot);
  }

  //list of food from sanpshot
  List<Food> menuFromSnapshot(QuerySnapshot snapshot){
    return snapshot.documents.map((e) => Food.fromJson(e.data)).toList();
  }
}
