import 'package:flutter/material.dart';

import 'package:honor_store/screens/search_screen.dart';

class SearchWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      width: double.infinity,
      height: 40.0,
      child: TextField(
        cursorColor: Colors.white,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 1.5,
              ),
            ),
            labelText: "Search",
            labelStyle: TextStyle(),
            prefixIcon: Icon(
              Icons.search,
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0)))),
        onSubmitted: (term) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SearchScreen(
                tag: term,
              ),
            ),
          );
        },
      ),
    );
  }
}
