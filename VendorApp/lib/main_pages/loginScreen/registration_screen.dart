import 'package:VendorApp/Data/dummy_data.dart';
import 'package:VendorApp/Services/auth.dart';
import 'package:VendorApp/main_pages/loginScreen/TextInput.dart';
import 'package:VendorApp/main_pages/loginScreen/loading_screen.dart';
import 'package:VendorApp/main_pages/loginScreen/login_screen.dart';
import 'package:fancy_dialog/FancyGif.dart';
import 'package:fancy_dialog/fancy_dialog.dart';
import 'package:flutter/material.dart';
import 'package:VendorApp/components/roundedButton.dart';
import 'package:VendorApp/components/constants.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = 'registration_screen';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = AuthService();
  final formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String errorMsg = '';
  String stallName = '';
  bool isLoading = false;
  String dropdownvalue = "Deck";
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.white,
        body: isLoading
            ? LoadingScreen()
            : SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Container(
                          height: height * 0.25,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Grab N' Go",
                                style: TextStyle(
                                    fontSize: 34,
                                    color: Color.fromRGBO(48, 47, 86, 100)),
                              ),
                              Text("Vendors",
                                  style: TextStyle(
                                      fontSize: 28, fontFamily: "Montserrat"))
                            ],
                          ),
                        ),
                        Container(
                            padding: EdgeInsets.symmetric(horizontal: 24),
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(164, 200, 242, 100),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(40),
                                  topRight: Radius.circular(40),
                                )),
                            height: height * 0.75,
                            child: Column(children: [
                              SizedBox(
                                height: 48,
                              ),
                              TextInput(
                                field: TextFormField(
                                  onChanged: (value) {
                                    setState(() {
                                      email = value;
                                    });
                                  },
                                  decoration: kTextFieldDecoration.copyWith(
                                    hintText: 'Enter Your Email',
                                  ),
                                ),
                                icon: Icon(
                                  Icons.mail_outline,
                                ),
                                height: height,
                                width: width,
                              ),
                              SizedBox(
                                height: 15.0,
                              ),
                              TextInput(
                                field: TextFormField(
                                  onChanged: (value) {
                                    setState(() {
                                      stallName = value;
                                    });
                                  },
                                  decoration: kTextFieldDecoration.copyWith(
                                    hintText: 'Enter Your Stall Name',
                                  ),
                                ),
                                icon: Icon(
                                  Icons.home,
                                ),
                                height: height,
                                width: width,
                              ),
                              SizedBox(height: 15),
                              TextInput(
                                field: TextFormField(
                                  obscureText: true,
                                  onChanged: (value) {
                                    setState(() {
                                      password = value;
                                    });
                                  },
                                  decoration: kTextFieldDecoration.copyWith(
                                    hintText: 'Enter Your Password',
                                  ),
                                ),
                                icon: Icon(
                                  Icons.lock_outline,
                                ),
                                height: height,
                                width: width,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Container(
                                width: width * 0.9,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(30)),
                                child: Row(children: [
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Icon(
                                    Icons.location_on,
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  DropdownButton<String>(
                                    value: dropdownvalue,
                                    items: locations
                                        .map<DropdownMenuItem<String>>(
                                            (e) => DropdownMenuItem<String>(
                                                  child: Text(e),
                                                  value: e,
                                                ))
                                        .toList(),
                                    onChanged: (String newValue) {
                                      setState(() {
                                        dropdownvalue = newValue;
                                      });
                                    },
                                  ),
                                ]),
                              ),
                              Container(
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                  child: Text(
                                    errorMsg.toString(),
                                    style: TextStyle(
                                        color: Colors.red, fontSize: 14),
                                  ),
                                ),
                              ),
                              RoundedButton(
                                color: Color.fromRGBO(51, 31, 121, 64.86),
                                title: 'Register',
                                onPressed: () async {
                                  setState(() {
                                    isLoading = true;
                                  });
                                  dynamic result = await _auth.registerUser(
                                      email,
                                      password,
                                      stallName,
                                      dropdownvalue);
                                  if (result == null) {
                                    setState(() {
                                      isLoading = false;
                                      errorMsg =
                                          'Please enter a valid email or password';
                                    });
                                  } else {
                                    setState(() {
                                      isLoading = false;
                                    });
                                    await buildShowDialog(context);
                                    Navigator.of(context)
                                        .pushReplacementNamed(LoginScreen.id);
                                  }
                                },
                              ),
                            ]))
                      ]),
                ),
              ));
  }

  buildShowDialog(BuildContext context) async {
    await showDialog(
        context: context,
        builder: (BuildContext context) => FancyDialog(
              descreption: 'Please verify your email by clicking the link sent',
              gifPath: FancyGif.CHECK_MAIL,
              title: '',
            ));
  }
}
