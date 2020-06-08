import 'package:VendorApp/Services/auth.dart';
import 'package:VendorApp/main_pages/loginScreen/Wrapper.dart';
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
                Container(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    child: Text(
                      errorMsg.toString(),
                      style: TextStyle(color: Colors.red, fontSize: 14),
                    ),
                  ),
                ),
                RoundedButton(
                  title: 'Register',
                  color: Colors.blueAccent,
                  onPressed: () async {
                    if (formKey.currentState.validate()) {
                      dynamic result = await _auth.registerUser(email, password);
                      if (result == null) {
                        setState(() {
                          errorMsg =
                              'Please enter a unused or valid email or password';
                        });
                      }else{
                        Navigator.of(context).pushReplacementNamed(Wrapper.id);
                      }
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
