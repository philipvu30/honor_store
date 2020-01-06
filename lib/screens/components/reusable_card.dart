import 'package:flutter/material.dart';
import 'package:honor_store/model/product.dart';
import 'package:honor_store/model/promotion.dart';
import 'package:honor_store/screens/constants.dart';
import 'package:honor_store/screens/home_screen.dart';
import 'package:honor_store/screens/product_detail_screen.dart';
import 'package:honor_store/screens/promotion_detail_screen.dart';
import 'package:honor_store/screens/promotion_screen.dart';
import 'package:honor_store/screens/service_screen.dart';
import 'package:honor_store/services/firebase_storage_service.dart';
import 'package:provider/provider.dart';

class ReusableCard extends StatelessWidget {
  final double width, height;
  final Screen screen;
  final Object obj;
  ReusableCard({this.obj, this.height, this.width, this.screen});

  @override
  Widget build(BuildContext context) {
    String imageUrl = obj is Product
        ? (obj as Product).images[0]
        : obj is Promotion ? (obj as Promotion).image : (obj as String);
    String productName = obj is Product ? (obj as Product).name : '';

    Widget getCardByScreen() {
      switch (screen) {
        case Screen.Home:
          // TODO: Handle this case.
          break;
        case Screen.Promotion:
          return Image.network(
            imageUrl,
            fit: BoxFit.cover,
          );
        case Screen.Product:
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 4,
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                flex: 1,
                child: Center(
                  child: Text(
                    productName,
                  ),
                ),
              ),
            ],
          );
        case Screen.Service:
          // TODO: Handle this case.
          break;
        case Screen.Store:
          // TODO: Handle this case.
          break;
      }
      return null;
    }

    return GestureDetector(
      onTap: () {
        Widget nextScreen;
        switch (screen) {
          case Screen.Promotion:
            if (obj != null && obj is Promotion) {
              Promotion p = (obj as Promotion);
              nextScreen = PromotionDetailScreen(promotion: p);
            }
            break;
          case Screen.Product:
            if (obj != null && obj is Product) {
              Product p = (obj as Product);
              nextScreen = ProductDetailScreen(product: p);
            }
            break;
          case Screen.Service:
            nextScreen = ServiceScreen();
            break;
          case Screen.Home:
            nextScreen = HomeScreen();
            break;
          case Screen.Store:
            // TODO: Handle this case.
            break;
        }
        if (nextScreen != null) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => nextScreen));
        }
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
        ),
        width: width,
        height: height,
        child: Card(
          margin: EdgeInsets.symmetric(horizontal: kReusableCardMargin),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          color: Color(kReusableCardBgColor),
          elevation: 5.0,
          child: ClipRRect(
            borderRadius: BorderRadius.all(
              Radius.circular(20.0),
            ),
            child: getCardByScreen(),
          ),
        ),
      ),
    );
  }
}
