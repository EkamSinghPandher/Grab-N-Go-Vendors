import 'package:flutter/material.dart';

class ImageTitle extends StatelessWidget {
  final double height;
  final double width;
  final String title;
  final Image image;
  final String location;

  const ImageTitle(this.height, this.width, this.title, this.image, this.location);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height*0.33,
      child: Stack(
        children: <Widget>[
          Container(height: height * 0.33, width: double.infinity, child: image),
          Positioned(
            width: width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  height: 80,
                                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(15, 10, 10, 3),
                        child: Text(title,
                            style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(16, 0, 10, 10),
                        child: Text(location,
                            style: TextStyle(fontSize: 15, color: Colors.white)),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: height* 0.06,
                  margin: EdgeInsets.fromLTRB(0, 16, 0, 0),
                  child: FloatingActionButton(
                    child: Icon(Icons.add),
                    backgroundColor: Colors.lightBlue,
                    onPressed: null,
                  ),
                )
              ],
            ),
            bottom: 5,
            left: 0,
          )
        ],
      ),
    );
  }
}
