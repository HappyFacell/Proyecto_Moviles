class Item {
  String id;
  String name;
  String img;
  String unit;
  double price;

  Item({
    required this.id,
    required this.name,
    required this.unit,
    required this.price,
    required this.img,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'unit': unit,
      'price': price,
      'img': img,
    };
  }

  static Item fromMap(Map<String, dynamic> item) {
    return Item(
      id: item['id'],
      name: item['name'],
      unit: item['unit'],
      price: double.parse(item['price'].toString()),
      img: item['img'],
    );
  }
}
