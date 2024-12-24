import 'package:flutter/material.dart';

Widget Comment(BuildContext context) {
  return AlertDialog(
    title: Text("Comments"),
    content: Text("Comments section goes here."),
    actions: [
      TextButton(
        child: Text("Close"),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    ],
  );
}
