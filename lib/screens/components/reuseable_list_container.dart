import 'package:flutter/material.dart';
import 'package:honor_store/model/product.dart';
import 'package:honor_store/screens/store_screen.dart';

import '../constants.dart';
import '../home_screen.dart';
import '../product_detail_screen.dart';
import '../promotion_screen.dart';
import '../service_screen.dart';

class ReusableListContainer extends StatelessWidget {
  final List<Widget> list;
  final String title;
  final Screen screen;
  final double height;
  final List<Object> lstObject;
  ReusableListContainer(
      {this.list, this.title, this.screen, this.height, this.lstObject});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Widget nextScreen;
              switch (screen) {
                case Screen.Promotion:
                  nextScreen = PromotionScreen();
                  break;
                case Screen.Product:
                  nextScreen = ProductDetailScreen();
                  break;
                case Screen.Service:
                  nextScreen = ServiceScreen();
                  break;
                case Screen.Home:
                  nextScreen = HomeScreen();
                  break;
                case Screen.Store:
                  if (lstObject is List<Product>) {
                    nextScreen = StoreScreen(
                      lstProduct: lstObject as List<Product>,
                    );
                  }
                  break;
              }
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => nextScreen));
            },
            child: ListTitle(
              title: title,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 16.0),
            width: double.infinity,
            height: height == null ? 200.0 : height,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: list,
            ),
          )
        ],
      ),
    );
  }
}

class ListTitle extends StatelessWidget {
  final String title;

  ListTitle({this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(8.0, 16.0, 0, 0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Row(
          children: <Widget>[
            Text(
              title,
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            Icon(
              Icons.arrow_right,
              color: Color(kTitleColor),
            ),
          ],
        ),
      ),
    );
  }
}
