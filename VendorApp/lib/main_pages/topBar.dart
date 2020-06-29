import 'package:flutter/material.dart';

AppBar topBar(BuildContext context, IconButton button) {
  return AppBar(
    elevation: 0.0,
    leading: null,
    actions: <Widget>[
      button == null
          ? IconButton(icon: Icon(Icons.search), onPressed: () {})
          : button,
    ],
    title: RichText(
      text: TextSpan(
        style: Theme.of(context)
            .textTheme
            .title
            .copyWith(fontWeight: FontWeight.bold),
        children: [
          TextSpan(
            text: "Grab",
            style: TextStyle(color: Colors.deepOrangeAccent),
          ),
          TextSpan(
            text: "&",
            style: TextStyle(color: Colors.grey),
          ),
          TextSpan(
            text: "Go",
            style: TextStyle(color: Colors.blueAccent),
          ),
        ],
      ),
    ),
    backgroundColor: Colors.white,
  );
}
