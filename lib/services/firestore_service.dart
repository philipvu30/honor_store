import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:honor_store/model/product.dart';
import 'package:honor_store/model/promotion.dart';

class FirestoreService {
  Future<List<Product>> getProductsStream() async {
    QuerySnapshot querySnapshot =
        await Firestore.instance.collection('products').getDocuments();
    List<Product> lstProducts = [];
    for (var doc in querySnapshot.documents) {
      lstProducts.add(Product.fromDocument(map: doc.data));
    }
    return lstProducts;
  }

  Future<List<Product>> getProductsStreamByTag(String tag) async {
    QuerySnapshot querySnapshot = await Firestore.instance
        .collection('products')
        .where(
          'tags',
          isEqualTo: tag,
        )
        .getDocuments();
    List<Product> lstProducts = [];
    for (var doc in querySnapshot.documents) {
      lstProducts.add(Product.fromDocument(map: doc.data));
    }
    return lstProducts;
  }

  Future<List<Promotion>> getPromotionsStream() async {
    QuerySnapshot querySnapshot =
        await Firestore.instance.collection('promotions').getDocuments();
    List<Promotion> lstPromotions = [];
    for (var doc in querySnapshot.documents) {
      lstPromotions.add(Promotion.fromDocument(map: doc.data));
    }
    return lstPromotions;
  }
}
