import 'package:flutter/material.dart';
import 'package:honor_store/model/product.dart';
import 'package:honor_store/model/promotion.dart';
import 'package:honor_store/screens/components/product_stream.dart';
import 'package:honor_store/screens/components/promotion_stream.dart';
import 'package:honor_store/screens/components/service_widget.dart';
import 'package:honor_store/services/firestore_service.dart';
import 'package:provider/provider.dart';

import '../constants.dart';

class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Product> lstProducts = [];
    List<Promotion> lstPromotions = [];

    Future<List<Product>> getProducts() async {
      final provider = Provider.of<FirestoreService>(context, listen: false);
      return lstProducts = await provider.getProductsStream();
    }

    Future<List<Promotion>> getPromotions() async {
      final provider = Provider.of<FirestoreService>(context, listen: false);
      return lstPromotions = await provider.getPromotionsStream();
    }

    return FutureBuilder(
        future: Future.wait([getProducts(), getPromotions()]),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          return Flexible(
            child: Container(
              margin: EdgeInsets.only(top: 10.0),
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    ProductStream(lstProducts),
                    PromotionStream(lstPromotions),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Dịch vụ',
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                    ServiceWidget(),
                    SizedBox(
                      height: 20.0,
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
