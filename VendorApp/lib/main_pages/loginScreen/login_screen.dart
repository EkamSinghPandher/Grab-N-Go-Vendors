import 'package:VendorApp/Services/auth.dart';
import 'package:VendorApp/components/roundedButton.dart';
import 'package:VendorApp/main_pages/loginScreen/Wrapper.dart';
import 'package:flutter/material.dart';
import 'package:VendorApp/components/constants.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    height: 200.0,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
                SizedBox(
                  height: 48.0,
                ),
                TextFormField(
                  validator: (val) => val.isEmpty ? 'Enter your email' : null,
                  onChanged: (value) {
                    setState(() {
                      email = value;
                    });
                  },
                  decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Enter Your Email',
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                TextFormField(
                  validator: (val) => (val.length < 8)
                      ? 'Password must be at least 8 character long'
                      : null,
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
                SizedBox(
                  height: 24.0,
                ),
                RoundedButton(
                  title: 'Log In',
                  color: Colors.lightBlueAccent,
                  onPressed: () async {
                    if (formKey.currentState.validate()) {
                      dynamic result = await _auth.signInUser(email, password);
                      if (result == null) {
                        setState(() {
                          errorMsg =
                              'Please enter a valid email or password';
                        });
                      }else{
                        Navigator.of(context).pushReplacementNamed(Wrapper.id);
                      }
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
