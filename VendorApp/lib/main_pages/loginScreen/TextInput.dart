import 'package:flutter/material.dart';

class TextInput extends StatefulWidget {
  final TextFormField field;
  final double height;
  final double width;
  final Icon icon;

  const TextInput({Key key, this.field, this.height, this.width, this.icon})
      : super(key: key);
  @override
  _TextInputState createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(30)),
      height: widget.height * 0.08,
      width: widget.width * 0.9,
      child: Row(children: [
        SizedBox(
          width: 20,
        ),
        widget.icon,
        Container(width: widget.width * 0.75, child: widget.field),
      ]),
    );
  }
}
