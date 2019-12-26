import 'package:flutter/material.dart';
import 'package:honor_store/model/product.dart';
import 'package:honor_store/screens/components/products_by_tag.dart';
import 'package:honor_store/services/firestore_service.dart';
import 'package:provider/provider.dart';

import 'constants.dart';

class SearchScreen extends StatelessWidget {
  final String tag;

  SearchScreen({this.tag});

  @override
  Widget build(BuildContext context) {
    List<Product> lstProducts;
    Future<List<Product>> getProducts() async {
      final provider = Provider.of<FirestoreService>(context, listen: false);
      return lstProducts = await provider.getProductsStreamByTag(tag);
    }

    Widget titleApp = Text('Search');

    return Scaffold(
      appBar: AppBar(
        title: titleApp,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Color(0xFF72A151),
      ),
      body: FutureBuilder(
        future: getProducts(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          return ProductsByTag(
            tag: tag,
            lstProducts: lstProducts,
          );
        },
      ),
    );
  }
}
