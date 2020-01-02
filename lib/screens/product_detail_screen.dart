import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:honor_store/model/product.dart';
import 'package:honor_store/screens/components/reuseable_list_container.dart';
import 'package:honor_store/services/firestore_service.dart';
import 'package:provider/provider.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'components/reusable_card.dart';
import 'constants.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;
  ProductDetailScreen({this.product});

  @override
  Widget build(BuildContext context) {
    List<Product> lstOtherProducts;
    Future<List<Product>> fetchOtherProducts(String tag) async {
      final provider = Provider.of<FirestoreService>(context, listen: false);
      lstOtherProducts = await provider.getProductsStreamByTag(tag);
      for (int i = 0; i < lstOtherProducts.length; i++) {
        if (lstOtherProducts[i].id == product.id) {
          lstOtherProducts.removeAt(i);
          break;
        }
      }
      return lstOtherProducts;
    }

    return FutureBuilder(
      future: fetchOtherProducts(product.tags),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_ios),
              ),
              actions: <Widget>[
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.add_shopping_cart),
                ),
              ],
            ),
            resizeToAvoidBottomPadding: false,
            body: Center(child: CircularProgressIndicator()),
          );
        }
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios),
            ),
            actions: <Widget>[
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.add_shopping_cart),
              ),
            ],
          ),
          resizeToAvoidBottomPadding: false,
          body: MainProductImage(product, lstOtherProducts),
        );
      },
    );
  }
}

class MainProductImage extends StatelessWidget {
  final Product product;
  final List<Product> lstOtherProducts;
  MainProductImage(this.product, this.lstOtherProducts);

  double getRating(List<int> lstStars) {
    int overallRating = 0;
    int totalRating = 0;
    for (int i = 1; i < 6; i++) {
      overallRating += lstStars[i - 1] * i;
      totalRating += lstStars[i - 1];
    }
    return overallRating / totalRating;
  }

  String getReviewsCount(List<int> lstStars) {
    int rating;
    int totalRating = 0;
    for (int i = 1; i < 6; i++) {
      totalRating += lstStars[i - 1];
    }
    rating = totalRating;
    return '$rating reviews';
  }

  List<Widget> getSizeWidgets(List<String> lstSize) {
    List<Widget> lstTmp = [];
    for (String size in lstSize) {
      lstTmp.add(SizeWidget(
        sizeText: size,
      ));
    }
    return lstTmp;
  }

  Widget getOtherProducts() {
    List<Widget> list = [];
    for (Product p in lstOtherProducts) {
      list.add(ReusableCard(
        obj: p,
        width: kReusableCardWidth,
        height: kReusableCardHeight,
        screen: Screen.Product,
      ));
    }

    return ReusableListContainer(
      list: list,
      title: "Sản phẩm khác",
      screen: Screen.Product,
      height: 160.0,
    );
  }

  String formatPrice(String price) {
    RegExp reg = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
    Function mathFunc = (Match match) => '${match[1]},';

    return price.replaceAllMapped(reg, mathFunc) + ' VND';
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> list = [];
    for (var image in product.images) {
      list.add(ReusableCard(obj: image, width: 320.0, height: 320.0));
    }
    return SafeArea(
      child: Column(
        children: <Widget>[
          Container(
            height: 200,
            margin: EdgeInsets.symmetric(vertical: 16.0),
            child: Swiper(
              itemBuilder: (context, index) {
                return Image.network(
                  product.images[index],
                  fit: BoxFit.cover,
                );
              },
              itemCount: product.images.length,
              viewportFraction: 0.8,
              scale: 0.8,
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Row(
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            product.name,
                            style: TextStyle(
                                fontFamily: 'OpenSans', fontSize: 24.0),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            formatPrice('${product.price}'),
                            style: TextStyle(
                                fontFamily: 'OpenSans', fontSize: 20.0),
                            textAlign: TextAlign.end,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Row(
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        StarRating(getRating(product.stars)),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          getReviewsCount(product.stars),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      "Size",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontFamily: 'OpenSans',
                      ),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Row(children: getSizeWidgets(product.size)),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      "Số lượng",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontFamily: 'OpenSans',
                      ),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    AmountWidget(),
                    SizedBox(
                      height: 8.0,
                    ),
                    DescriptionWidget(product.description),
                    Container(
                      child: getOtherProducts(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class StarRating extends StatefulWidget {
  final double rating;
  StarRating(this.rating);

  @override
  _StarRatingState createState() => _StarRatingState();
}

class _StarRatingState extends State<StarRating> {
  double rating;
  @override
  Widget build(BuildContext context) {
    rating = widget.rating;
    return SmoothStarRating(
        allowHalfRating: false,
        onRatingChanged: (v) {
          setState(() {});
        },
        starCount: 5,
        rating: rating,
        size: 24.0,
        color: Colors.deepOrange,
        borderColor: Colors.deepOrange,
        spacing: 0.0);
  }
}

class DescriptionWidget extends StatelessWidget {
  final String description;

  DescriptionWidget(this.description);

  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            "Công dụng",
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 16.0,
              fontFamily: 'OpenSans',
            ),
          ),
          Expandable(
            collapsed: ExpandableButton(
              child: Text(
                description.replaceAll("\\n", "\n"),
                softWrap: true,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.blue),
              ),
            ),
            expanded: Column(
              children: <Widget>[
                Text(
                  description.replaceAll('\\n', '\n'),
                  softWrap: true,
                ),
                ExpandableButton(
                  child: Icon(Icons.keyboard_arrow_up),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AmountWidget extends StatefulWidget {
  @override
  _AmountWidgetState createState() => _AmountWidgetState();
}

class _AmountWidgetState extends State<AmountWidget> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 105.0,
      height: 30.0,
      child: Material(
        borderRadius: BorderRadius.circular(20.0),
        elevation: 5.0,
        color: Colors.lightGreen,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.add),
              iconSize: 16.0,
              color: Colors.white,
              onPressed: () {
                setState(() {
                  counter++;
                });
              },
            ),
            Text(
              "$counter",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            IconButton(
              icon: Icon(Icons.remove),
              iconSize: 16.0,
              color: Colors.white,
              onPressed: () {
                setState(() {
                  counter != 0 ? counter-- : counter = counter;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SizeWidget extends StatefulWidget {
  final String sizeText;

  SizeWidget({this.sizeText});

  @override
  _SizeWidgetState createState() => _SizeWidgetState();
}

class _SizeWidgetState extends State<SizeWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Material(
        borderRadius: BorderRadius.circular(20.0),
        elevation: 5.0,
        color: Colors.lightGreen,
        child: GestureDetector(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
            child: Text(
              widget.sizeText,
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
