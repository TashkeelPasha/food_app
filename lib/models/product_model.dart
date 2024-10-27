class ProductModel {
  String? name;

  String? description;

  num? price;

  ProductModel({this.name, this.description, this.price});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'price': price,
    };
  }
}
