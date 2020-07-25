import 'package:VendorApp/Models/Food.dart';
import 'package:VendorApp/Models/Message.dart';
import 'package:VendorApp/Models/Order.dart';
import 'package:VendorApp/Models/Vendor.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DataService {
  final String uid;

  DataService({this.uid});

  //collection references
  final CollectionReference vendorsCollection =
      Firestore.instance.collection('Vendors');
  final CollectionReference locationsCollection =
      Firestore.instance.collection('LocationList');
  final CollectionReference studentsCollection =
      Firestore.instance.collection('Students');

  //updating vendor data
  Future updateVendorData(Vendor vendor) async {
    return await vendorsCollection
        .document(vendor.uid)
        .setData(vendor.toJson());
  }

  //updating location data
  Future updateLocationData(Vendor vendor) async {
    return locationsCollection
        .document(vendor.loc)
        .collection('Stalls')
        .document(vendor.uid)
        .setData(vendor.toJson());
  }

  //Add/edit food to menu
  Future updateMenu(Vendor vendor, Food food) async {
    await vendorsCollection
        .document(vendor.uid)
        .collection('Menu')
        .document(food.uid)
        .setData(food.toJson());
    return locationsCollection
        .document(vendor.loc)
        .collection('Stalls')
        .document(vendor.uid)
        .collection('Menu')
        .document(food.uid)
        .setData(food.toJson());
  }

  //Order is done
  Future doneOrder(Order order) async {
    await vendorsCollection
        .document(order.vendorUID)
        .collection('Orders')
        .document(order.orderID)
        .setData(order.doneOrder().toJson());
    studentsCollection
        .document(order.studentUID)
        .collection('Orders')
        .document(order.orderID)
        .setData(order.doneOrder().toJson());
    sendMessage(
        order,
        Message(
            sendorID: order.vendorUID,
            vendorID: order.vendorUID,
            studentID: order.studentUID,
            text: "Your order is ready for collection",
            time: DateTime.now()));
  }

  //Order is collected
  Future collectedOrder(Order order) async {
    studentsCollection
        .document(order.studentUID)
        .collection('Orders')
        .document(order.orderID)
        .collection('Messages')
        .getDocuments()
        .then((value) {
      for (DocumentSnapshot doc in value.documents) {
        doc.reference.delete();
      }
    });
    studentsCollection
        .document(order.studentUID)
        .collection('Orders')
        .document(order.orderID)
        .setData(order.collectedOrder().toJson());
    await vendorsCollection
        .document(order.vendorUID)
        .collection('Orders')
        .document(order.orderID)
        .collection('Messages')
        .getDocuments()
        .then((value) {
      for (DocumentSnapshot doc in value.documents) {
        doc.reference.delete();
      }
    });
    await vendorsCollection
        .document(order.vendorUID)
        .collection('Orders')
        .document(order.orderID)
        .delete();
  }

  //get vendor stream
  Stream<Vendor> get vendors {
    return vendorsCollection.snapshots().map(vendorFromSnapshot);
  }

  //get List of Vendors
  Vendor vendorFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents
        .map((doc) {
          return Vendor.fromJson((doc.data));
        })
        .toList()
        .firstWhere((element) => element.uid == this.uid);
  }

  //get menu from a vendor
  Stream<List<Food>> menuFromVendor() {
    return vendorsCollection
        .document(uid)
        .collection('Menu')
        .snapshots()
        .map(menuFromSnapshot);
  }

  //list of food from sanpshot
  List<Food> menuFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((e) => Food.fromJson(e.data)).toList();
  }

  //get orders for this vendor
  Stream<List<Order>> get myOrders {
    return vendorsCollection
        .document(uid)
        .collection('Orders')
        .snapshots()
        .map(ordersFromSnapshot);
  }

  List<Order> ordersFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((e) => Order.fromJson(e.data)).toList();
  }

  //Get Stream of messages from an order
  Stream<List<Message>> messagesFromOrder(Order order) {
    return vendorsCollection
        .document(uid)
        .collection('Orders')
        .document(order.orderID)
        .collection("Messages")
        .snapshots()
        .map(messagesFromSnapshot);
  }

  //get a list of messages from a snapshot
  List<Message> messagesFromSnapshot(QuerySnapshot snaphsot) {
    return snaphsot.documents.map((e) => Message.fromJson(e.data)).toList();
  }

  //send message
  Future sendMessage(Order order, Message message) async {
    await vendorsCollection
        .document(order.vendorUID)
        .collection('Orders')
        .document(order.orderID)
        .collection("Messages")
        .document(message.time.toIso8601String())
        .setData(message.toJson());
    studentsCollection
        .document(order.studentUID)
        .collection('Orders')
        .document(order.orderID)
        .collection("Messages")
        .document(message.time.toIso8601String())
        .setData(message.toJson());
  }

  //Vendor delete food
  Future deleteFood(Food food, Vendor vendor) async {
    await vendorsCollection
        .document(vendor.uid)
        .collection('Menu')
        .document(food.uid)
        .delete();
    locationsCollection
        .document(vendor.loc)
        .collection('Stalls')
        .document(vendor.uid)
        .collection('Menu')
        .document(food.uid)
        .delete();
  }
}
