// {
//   "product_id": 101,
//   "product_name": "Smartphone",
//   "price": 699.99,
//   "in_stock": true,
//   "specifications": {
//     "brand": "TechCorp",
//     "battery": "4000mAh",
//     "camera": "64MP"
//   }
// }

class Model {
  int? productid;
  String? productname;
  double? price;
  bool? instock;
  Specifications specifications;
  Model(
      {required this.instock,
      required this.price,
      required this.productid,
      required this.productname,
      required this.specifications});

  factory Model.fromjson(Map<String, dynamic> jsons) {
    return Model(
        instock: jsons['in_stock'],
        price: jsons['price'],
        productid: jsons['product_id'],
        productname: jsons['product_name'],
        specifications: jsons['specifications']);
  }
}

class Specifications {
  String? brand;
  String? battery;
  String? camera;
  Specifications(
      {required this.battery, required this.brand, required this.camera});

  factory Specifications.fromjson(Map<String, dynamic> jsons) {
    return Specifications(
      battery: jsons[''],
      brand: '',
      camera: '',
    );
  }
}
