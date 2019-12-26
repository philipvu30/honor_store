import 'package:flutter/material.dart';
import 'package:honor_store/model/product.dart';
import 'components/products_by_tag.dart';
import 'constants.dart';

class StoreScreen extends StatelessWidget {
  final List<Product> lstProduct;

  StoreScreen({this.lstProduct});

  @override
  Widget build(BuildContext context) {
    Widget titleApp = Text('Honor');
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: titleApp,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: Color(0xFF72A151),
          bottom: TabBar(
            labelColor: Colors.deepOrangeAccent,
            unselectedLabelColor: Colors.white,
            tabs: <Widget>[
              Tab(
                text: kTabAll,
              ),
              Tab(
                text: kTabWine,
              ),
              Tab(
                text: kTabOil,
              ),
              Tab(
                text: kTabOther,
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ProductsByTag(
              tag: kTagAll,
              lstProducts: lstProduct,
            ),
            ProductsByTag(
              tag: kTagWine,
              lstProducts: lstProduct,
            ),
            ProductsByTag(
              tag: kTagOil,
              lstProducts: lstProduct,
            ),
            ProductsByTag(
              tag: kTagOther,
              lstProducts: lstProduct,
            ),
          ],
        ),
      ),
    );
  }
}
