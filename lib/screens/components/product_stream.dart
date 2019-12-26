import 'package:flutter/material.dart';
import 'package:honor_store/model/product.dart';
import 'package:honor_store/screens/components/reusable_card.dart';
import 'package:honor_store/screens/components/reuseable_list_container.dart';
import '../constants.dart';

class ProductStream extends StatelessWidget {
  final List<Product> products;

  ProductStream(this.products);

  List<Widget> lstWidget(List<Product> products) {
    List<Widget> widgets = [];
    for (var p in products) {
      widgets.add(ReusableCard(
        obj: p,
        screen: Screen.Product,
        width: kReusableCardWidth,
        height: kReusableCardHeight,
      ));
    }
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return ReusableListContainer(
      list: lstWidget(products),
      title: "Cửa hàng",
      screen: Screen.Store,
      lstObject: products,
    );
  }
}
