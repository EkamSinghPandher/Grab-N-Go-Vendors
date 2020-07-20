import 'package:VendorApp/Services/auth.dart';
import 'package:VendorApp/components/roundedButton.dart';
import 'package:VendorApp/main_pages/loginScreen/Wrapper.dart';
import 'package:VendorApp/main_pages/loginScreen/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:VendorApp/components/constants.dart';

import 'TextInput.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = AuthService();
  final formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String errorMsg = '';
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: isLoading
          ? Center(
              child: Container(
                  height: 400,
                  width: 200,
                  child: Dialog(
                    child: CircularProgressIndicator(),
                  )))
          : SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  children: <Widget>[
                    Container(
                      height: height * 0.30,
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
                      height: height * 0.70,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          SizedBox(
                            height: 65,
                          ),
                          TextInput(
                            icon: Icon(
                              Icons.mail_outline,
                              size: 30,
                            ),
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
                            height: height,
                            width: width,
                          ),
                          SizedBox(
                            height: 18.0,
                          ),
                          TextInput(
                            icon: Icon(
                              Icons.lock_outline,
                              size: 30,
                            ),
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
                            height: height,
                            width: width,
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(0, 15, 0, 10),
                              child: Text(
                                errorMsg.toString(),
                                style:
                                    TextStyle(color: Colors.red, fontSize: 14),
                              ),
                            ),
                          ),
                          RoundedButton(
                              title: 'Log In',
                              color: Color.fromRGBO(51, 31, 121, 64.86),
                              onPressed: () async {
                                setState(() {
                                  isLoading = true;
                                });
                                // ignore: unused_local_variable
                                dynamic result = _auth
                                    .signInUser(email, password)
                                    .then((result) {
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
                                    Navigator.of(context)
                                        .pushReplacementNamed(Wrapper.id);
                                  }
                                });
                              }),
                          FlatButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .pushNamed(RegistrationScreen.id);
                              },
                              child: Text(
                                "Create Account",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
