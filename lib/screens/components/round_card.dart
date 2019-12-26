import 'package:flutter/material.dart';

class RoundCard extends StatelessWidget {
  final String image;

  RoundCard(this.image);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      color: Color(0xfffff6e5),
      elevation: 10.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0)),
              child: Image(
                image: AssetImage(image),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
