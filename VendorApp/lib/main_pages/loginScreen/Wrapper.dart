import 'package:VendorApp/Models/User.dart';
import 'package:VendorApp/main_pages/loginScreen/welcome_screen.dart';
import 'package:VendorApp/main_pages/page_logic.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  static const id = 'Wrapper_screen';

  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<User>(context);
    return user == null ? WelcomeScreen() : PageLogic();
  }
}
