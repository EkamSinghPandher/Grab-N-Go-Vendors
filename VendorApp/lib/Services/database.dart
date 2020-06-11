import 'package:VendorApp/Models/Vendor.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class DataService{

  final String uid;

  DataService({this.uid});

  //collection reference
  final CollectionReference vendorsCollection = Firestore.instance.collection('Vendors');

  //uodating user data
  Future updateVendorData(Vendor vendor) async{
      return await vendorsCollection.document(vendor.uid).setData(vendor.toJson());
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
}