import 'package:VendorApp/Services/auth.dart';
import 'package:VendorApp/main_pages/loginScreen/Wrapper.dart';
import 'package:flutter/material.dart';
import 'package:VendorApp/main_pages/loginScreen/welcome_screen.dart';
import 'package:VendorApp/main_pages/loginScreen/login_screen.dart';
import 'package:VendorApp/main_pages/loginScreen/registration_screen.dart';
import 'package:provider/provider.dart';
import 'Models/Vendor.dart';
import 'main_pages/page_logic.dart';

void main() {
  runApp(GrabNGo());
}

class GrabNGo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<Vendor>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
        routes: {
          Wrapper.id: (context) => Wrapper(),
          WelcomeScreen.id: (context) => WelcomeScreen(),
          LoginScreen.id: (context) => LoginScreen(),
          RegistrationScreen.id: (context) => RegistrationScreen(),
          PageLogic.id: (context) => PageLogic(),
        },
      ),
    );
  }
}
