import 'package:cloud_firestore/cloud_firestore.dart';

class Repository {
  final Firestore _firestore = Firestore.instance;
  static Repository repository;
  static Repository instance() {
    if (repository == null) {
      return Repository();
    }
    return repository;
  }
}
