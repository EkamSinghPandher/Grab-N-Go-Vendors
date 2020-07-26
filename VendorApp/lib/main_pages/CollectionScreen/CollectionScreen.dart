import 'package:VendorApp/main_pages/CollectionScreen/CollectionList.dart';
import 'package:flutter/material.dart';

class CollectionScreen extends StatefulWidget {
  @override
  _CollectionScreenState createState() => _CollectionScreenState();
}

class _CollectionScreenState extends State<CollectionScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: height,
        child: Container(
          child: Column(
            children: [
              Container(
                height: height * 0.11,
                alignment: Alignment.bottomCenter,
                child: FittedBox(
                  child: Text(
                    'Collections',
                    style: TextStyle(
                      color: Colors.blue.shade800,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w500,
                      fontSize: 30.0,
                    ),
                  ),
                  fit: BoxFit.fitHeight,
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              CollectionList(
                width: width,
                height: height * 0.78,
              )
            ],
          ),
        ),
      ),
    );
  }
}
