import 'dart:io';

import 'package:flutter/material.dart';
import 'package:honor_store/services/firebase_authentication_service.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class HomeScreenAvatar extends StatefulWidget {
  @override
  _HomeScreenAvatarState createState() => _HomeScreenAvatarState();
}

class _HomeScreenAvatarState extends State<HomeScreenAvatar> {
  @override
  Widget build(BuildContext context) {
    final _firebaseAuth = Provider.of<FirebaseAuthenticationService>(context);
    String name = _firebaseAuth.firebaseUser == null
        ? ''
        : _firebaseAuth.firebaseUser.displayName;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
          decoration: BoxDecoration(color: Colors.transparent),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  "Xin chào, $name",
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: CircleAvatar(
                  radius: 20.0,
                ),
              ),
            ],
          )),
    );
  }
}
