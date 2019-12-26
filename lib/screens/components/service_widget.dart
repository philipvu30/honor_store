import 'package:flutter/material.dart';

class ServiceWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        RawMaterialButton(
          child: IconButton(
            onPressed: () {},
            icon: Icon(Icons.child_care),
            iconSize: 35.0,
          ),
          shape: CircleBorder(),
          elevation: 10.0,
          fillColor: Color(0xFFED764E),
        ),
        RawMaterialButton(
          child: IconButton(
            onPressed: () {},
            icon: Icon(Icons.face),
            iconSize: 35.0,
          ),
          shape: CircleBorder(),
          elevation: 5.0,
          fillColor: Color(0xffC284E5),
        ),
      ],
    );
  }
}
