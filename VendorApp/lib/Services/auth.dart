import 'package:VendorApp/Models/User.dart';
import 'package:VendorApp/Models/Vendor.dart';
import 'package:VendorApp/Services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<User> get user {
    return _auth.onAuthStateChanged.map(_userFromData);
  }

  User _userFromData(FirebaseUser user) {
    return user == null ? null : User(uid: user.uid);
  }

  // sign in with email and password
  Future signInUser(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      if (user.isEmailVerified) return _userFromData(user);
      return null;
    } catch (error) {
      return null;
    }
  }

  //register with email and password
  Future registerUser(
      String email, String password, String stallName, String location) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      Vendor newVendor = Vendor(
        loc: location,
        uid: user.uid,
        email: user.email,
        phoneNumber: 96457651,
        stallImage:
            'https://res.cloudinary.com/hkf2ycaep/image/fetch/d_project-placeholder.png,f_auto/https:/assets/project-placeholder-b90804f0a659d3f283c62d185d49635da22a5b8bbfb7e985f0d0390201f9d2b1.png',
        stallName: stallName,
      );
      await DataService(uid: user.uid).updateVendorData(newVendor);
      await DataService(uid: user.uid).updateLocationData(newVendor);
      await user.sendEmailVerification();
      return _userFromData(user);
    } catch (error) {
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
