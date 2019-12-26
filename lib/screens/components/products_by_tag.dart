import 'package:flutter/material.dart';
import 'package:honor_store/model/product.dart';
import 'package:honor_store/screens/product_detail_screen.dart';

import '../constants.dart';

class ProductsByTag extends StatelessWidget {
  final String tag;
  final List<Product> lstProducts;
  ProductsByTag({this.tag, this.lstProducts});

  List<Widget> lstProductDetail(List<Product> lstProducts) {
    List<Widget> lstWidgets = [];
    for (var p in lstProducts) {
      if (p.tags.contains(tag)) {
        lstWidgets.add(ProductDetail(p));
      } else if (tag == kTagAll) {
        lstWidgets.add(ProductDetail(p));
      }
    }
    return lstWidgets;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      child: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        shrinkWrap: true,
        childAspectRatio: (kItemGridHeight / kItemGridWidth),
        children: lstProductDetail(lstProducts),
      ),
    );
  }
}

class ProductDetail extends StatelessWidget {
  final Product product;

  ProductDetail(this.product);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailScreen(
              product: product,
            ),
          ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        color: Color(0xfffff6e5),
        elevation: 10.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 3,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0)),
                child: Image.network(
                  product.images[0],
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Row(
                        textBaseline: TextBaseline.alphabetic,
                        children: <Widget>[
                          Text(
                            product.name,
                            style: TextStyle(fontSize: 14.0),
                          ),
                          Expanded(
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.add_shopping_cart,
                                color: Colors.black,
                              ),
                              iconSize: 18.0,
                              alignment: Alignment.centerRight,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Row(
                        children: <Widget>[
                          Text(
                            '${product.price}VND',
                            style: TextStyle(fontSize: 14.0),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
