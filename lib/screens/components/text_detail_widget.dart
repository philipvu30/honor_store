import 'package:flutter/material.dart';

class TextDetailWidget extends StatelessWidget {
  final String title;

  TextDetailWidget({this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Text(
            title,
            textAlign: TextAlign.left,
          ),
        ),
      ],
    );
  }
}
