class Promotion {
  String id;
  String image;
  String code;

  Promotion({this.id, this.image, this.code});

  static Promotion fromDocument({Map<String, dynamic> map}) {
    Promotion promotion = Promotion();
    promotion.id = map["id"];
    promotion.code = map["code"];
    promotion.image = map["image"];

    return promotion;
  }
}
