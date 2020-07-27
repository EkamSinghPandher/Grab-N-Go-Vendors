import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Grab N' Go",
              style: TextStyle(
                fontSize: 34,
                color: Color.fromRGBO(48, 47, 86, 100),
              ),
            ),
            SpinKitDoubleBounce(
              color: Colors.blue,
              size: 100.0,
            ),
          ],
        ),
      ),
    );
  }
}
