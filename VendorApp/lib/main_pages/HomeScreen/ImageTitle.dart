import 'package:VendorApp/Models/Vendor.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ImageTitle extends StatefulWidget {
  //Creates the Image and title stack of the vendors homepage
  final double height;
  final double width;

  const ImageTitle(
    this.height,
    this.width,
  );

  @override
  _ImageTitleState createState() => _ImageTitleState();
}

class _ImageTitleState extends State<ImageTitle> {
  @override
  Widget build(BuildContext context) {
    final Vendor vendor = Provider.of<Vendor>(context);
    return vendor == null
        ? CircularProgressIndicator()
        : Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
            height: widget.height * 0.8,
            width: widget.width,
            child: Stack(
                alignment: Alignment.bottomCenter,
                overflow: Overflow.clip,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(27),
                        bottomRight: Radius.circular(27)),
                    child: Container(
                        width: widget.width,
                        height: widget.height,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(25),
                              bottomRight: Radius.circular(25)),
                        ),
                        child: Image.network(
                          vendor.stallImage,
                          fit: BoxFit.fitWidth,
                          color: Colors.black45,
                          colorBlendMode: BlendMode.darken,
                        )),
                  ),
                  Container(
                    height: widget.height * 0.25,
                    width: widget.width,
                    padding: EdgeInsets.fromLTRB(25, 10, 25, 10),
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: Text(
                        vendor.stallName,
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ]),
          );
  }
}
