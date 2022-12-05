import 'package:cloud_firestore/cloud_firestore.dart';

class Order {
  String id;
  bool isActive;
  String userId;
  DateTime creationDate;
  DateTime? closureDate;

  Order({
    required this.id,
    required this.isActive,
    required this.userId,
    required this.creationDate,
    this.closureDate,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'isActive': isActive,
      'userId': userId,
      'creationDate': Timestamp.fromDate(creationDate),
      'closureDate':
          closureDate == null ? null : Timestamp.fromDate(closureDate!),
    };
  }

  static Order fromMap(Map<String, dynamic> order) {
    return Order(
      id: order['id'],
      isActive: order['isActive'],
      userId: order['userId'],
      creationDate: DateTime.fromMicrosecondsSinceEpoch(
          (order['creationDate'] as Timestamp).microsecondsSinceEpoch),
      closureDate: DateTime.tryParse(order['closureDate'].toString()),
    );
  }
}

class OrderDetail {
  String id;
  String orderId;
  String itemId;
  int amount;

  OrderDetail({
    required this.id,
    required this.orderId,
    required this.itemId,
    required this.amount,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'orderId': orderId,
      'itemId': itemId,
      'amount': amount,
    };
  }

  static OrderDetail fromMap(Map<String, dynamic> orderDetail) {
    return OrderDetail(
      id: orderDetail['id'],
      orderId: orderDetail['orderId'],
      itemId: orderDetail['itemId'],
      amount: orderDetail['amount'],
    );
  }
}
