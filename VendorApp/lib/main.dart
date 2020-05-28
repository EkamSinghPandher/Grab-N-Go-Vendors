import 'package:flutter/material.dart';
import 'package:VendorApp/login/welcome_screen.dart';
import 'package:VendorApp/login/login_screen.dart';
import 'package:VendorApp/login/registration_screen.dart';
import 'package:VendorApp/main_pages/home_screen.dart';
import 'main_pages/page_logic.dart';

void main() {
  runApp(GrabNGo());
}

class GrabNGo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        PageLogic.id: (context) => PageLogic(),
      },
    );
  }
}
