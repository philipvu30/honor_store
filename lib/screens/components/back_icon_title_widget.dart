import 'package:flutter/material.dart';

class BackIconTitleWidget extends StatelessWidget {
  final String title;

  BackIconTitleWidget({this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            size: 36.0,
            color: Colors.black,
          ),
        ),
        Spacer(

        ),
        GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(
            Icons.shopping_cart,
            size: 36.0,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}