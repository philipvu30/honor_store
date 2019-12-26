import 'package:flutter/material.dart';

class HomeScreenAvatar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(color: Colors.transparent),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Text(
                "Hi Sarah, \nwelcome to my store",
                style: TextStyle(fontSize: 18.0),
              ),
            ),
            CircleAvatar(
              radius: 20.0,
              backgroundColor: Colors.amberAccent,
            )
          ],
        ));
  }
}
