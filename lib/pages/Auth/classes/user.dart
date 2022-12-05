class User {
  String id;
  bool isTaker;
  String name;

  User({
    required this.id,
    required this.isTaker,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'isTaker': isTaker,
      'name': name,
    };
  }

  static User fromMap(Map<String, dynamic> user) {
    return User(
      id: user['id'],
      isTaker: user['isTaker'],
      name: user['name'],
    );
  }
}
