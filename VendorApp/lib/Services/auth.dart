import 'package:VendorApp/Models/Vendor.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:VendorApp/Data/dummy_data.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;


  Stream<Vendor> get user {
    return _auth.onAuthStateChanged.map(_vendorFromUser);
  }

  Vendor _vendorFromUser(FirebaseUser user) {
    return user == null
        ? null
        : Vendor(
            uid: user.uid,
            email: user.email,
            phoneNumber: 96457651,
            stallImage: 'images/shop-image.jpg',
            stallName: 'New Stall',
            menu: menu);
  }

  // sign in with email and password
  Future signInUser(String email, String password) async{
    try{
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return _vendorFromUser(user);
    }catch(error){
      return null;
    }
  }

  //register with email and password
  Future registerUser(String email, String password) async{
    try{
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return _vendorFromUser(user);
    }catch(error){
      return null;
    }
  }

  // logout
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

}
