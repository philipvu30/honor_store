class Product {
  String id;
  List<String> images;
  String name;
  List<int> stars;
  List<String> size;
  String description;
  int price;
  String tags;

  Product();

  Product.setProduct(this.id, this.images, this.name, this.stars, this.size,
      this.description, this.price, this.tags);

  static Product fromDocument({Map<String, dynamic> map}) {
    Product product = Product();
    product.id = map["id"];
    product.images = List.from(map["images"]);
    product.name = map["name"];
    product.stars = List.from(map["stars"]);
    product.size = List.from(map["size"]);
    product.description = map["description"];
    product.price = map["price"];
    product.tags = map["tags"];
    return product;
  }
}
