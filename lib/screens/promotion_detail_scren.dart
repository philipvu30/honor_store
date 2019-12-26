import 'package:flutter/material.dart';
import 'package:honor_store/model/promotion.dart';

class PromotionDetailScreen extends StatelessWidget {
  final Promotion promotion;

  PromotionDetailScreen({this.promotion});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios),
          ),
        ),
        resizeToAvoidBottomPadding: false,
        body: Image.asset(
          promotion.image,
          fit: BoxFit.fill,
          width: double.infinity,
          height: double.infinity,
        ));
  }
}
