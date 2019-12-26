import 'package:flutter/material.dart';
import 'package:honor_store/model/promotion.dart';
import 'package:honor_store/screens/components/reusable_card.dart';
import 'package:honor_store/screens/components/reuseable_list_container.dart';

import '../constants.dart';

class PromotionStream extends StatelessWidget {
  List<Widget> lstWidget(List<Promotion> promotions) {
    List<Widget> widgets = [];
    for (var p in promotions) {
      widgets.add(ReusableCard(
        obj: p,
        screen: Screen.Promotion,
        width: kReusableCardWidth,
        height: kReusableCardHeight,
      ));
    }
    return widgets;
  }

  final List<Promotion> promotions;

  PromotionStream(this.promotions);

  @override
  Widget build(BuildContext context) {
    return ReusableListContainer(
      list: lstWidget(promotions),
      title: "Khuyến mãi",
      screen: Screen.Promotion,
    );
  }
}
