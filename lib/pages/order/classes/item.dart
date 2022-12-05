class Item {
  String id;
  String name;
  String unit;
  double price;

  Item({
    required this.id,
    required this.name,
    required this.unit,
    required this.price,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'unit': unit,
      'price': price,
    };
  }

  static Item fromMap(Map<String, dynamic> item) {
    return Item(
      id: item['id'],
      name: item['name'],
      unit: item['unit'],
      price: item['price'],
    );
  }
}
