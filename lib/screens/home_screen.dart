import 'package:flutter/material.dart';
import 'package:honor_store/screens/components/home_body.dart';
import 'components/home_screen_avatar.dart';
import 'components/search_widget.dart';
import 'constants.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            HomeScreenAvatar(),
            SearchWidget(),
            HomeBody(),
          ],
        ),
      ),
    );
  }
}
