import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:project/pages/auth/db/auth_repository.dart';
import 'package:project/pages/order/classes/item.dart';
import '../classes/order.dart' as order_lib;

class OrderRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  FutureOr<order_lib.Order> createNewOrder() async {
    var currentUserUid = _auth.currentUser!.uid;

    order_lib.Order newOrder = order_lib.Order(
      id: '',
      isActive: true,
      userId: currentUserUid,
      creationDate: DateTime.now(),
      closureDate: null,
    );

    var doc = await FirebaseFirestore.instance
        .collection('order')
        .add(newOrder.toMap());
    await FirebaseFirestore.instance.collection('order').doc(doc.id).update(
      {
        'id': doc.id,
      },
    );

    return newOrder;
  }

  Future<List<order_lib.Order>> getOrderHistory() async {
    var currentUserUid = _auth.currentUser!.uid;
    final userCollection = await FirebaseFirestore.instance
        .collection("order")
        .where("userId", isEqualTo: currentUserUid)
        .where('isActive', isEqualTo: false)
        .orderBy('closureDate')
        .limit(10)
        .get();
    List<order_lib.Order> orders = [];

    // Convert data to Orders
    for (var orderMap in userCollection.docs) {
      order_lib.Order tempOrder = order_lib.Order.fromMap(orderMap.data());
      tempOrder.id = orderMap.id;
      orders.add(tempOrder);
    }

    return orders;
  }

  FutureOr<List<order_lib.Order>> getActiveOrders() async {
    var currentUserUid = _auth.currentUser!.uid;

    final QuerySnapshot<Map<String, dynamic>> userCollection;

    if (await RepositoryAuth().isTaker(currentUserUid)) {
      userCollection = await FirebaseFirestore.instance
          .collection("order")
          .where('isActive', isEqualTo: true)
          .get();
    } else {
      userCollection = await FirebaseFirestore.instance
          .collection("order")
          .where("userId", isEqualTo: currentUserUid)
          .where('isActive', isEqualTo: true)
          .get();
    }

    List<order_lib.Order> orders = [];

    // Convert data to Orders
    for (var orderMap in userCollection.docs) {
      order_lib.Order tempOrder = order_lib.Order.fromMap(orderMap.data());
      tempOrder.id = orderMap.id;
      orders.add(tempOrder);
    }

    return orders;
  }

  /// Get a selected [order] details
  FutureOr<List<order_lib.OrderDetail>> getOrderDetails(
      order_lib.Order order) async {
    var currentUserUid = _auth.currentUser!.uid;

    // Get all order details
    QuerySnapshot userCollection = await FirebaseFirestore.instance
        .collection("orderDetail")
        .where('orderId', isEqualTo: order.id)
        .get();

    List<order_lib.OrderDetail> orderDetails = [];

    // Convert data to Orders
    for (var orderMap in userCollection.docs) {
      order_lib.OrderDetail tempOrder = order_lib.OrderDetail.fromMap(
          orderMap.data() as Map<String, dynamic>);
      tempOrder.id = orderMap.id;
      orderDetails.add(tempOrder);
    }

    return orderDetails;
  }

  /// Add a certain [order] details
  FutureOr<order_lib.OrderDetail> addOrderDetail(
      order_lib.Order order, order_lib.OrderDetail detail) async {
    var currentUserUid = _auth.currentUser!.uid;

    detail.orderId = order.id;

    // Get all order details
    var doc = await FirebaseFirestore.instance
        .collection("orderDetail")
        .add(detail.toMap());

    await FirebaseFirestore.instance
        .collection('orderDetail')
        .doc(doc.id)
        .update(
      {
        'id': doc.id,
      },
    );

    return detail;
  }

  FutureOr<Item> getItem(String id) async {
    DocumentSnapshot doc =
        await FirebaseFirestore.instance.collection('item').doc(id).get();
    print(doc.data());
    Item item = Item.fromMap(doc.data() as Map<String, dynamic>);
    item.id = doc.id;
    return item;
  }

  FutureOr<double> getOrderTotal(order_lib.Order order) async {
    List<order_lib.OrderDetail> details = await getOrderDetails(order);
    double total = 0;
    for (var detail in details) {
      Item currentItem = await getItem(detail.itemId);
      total += detail.amount * currentItem.price;
    }
    return total;
  }

  Future<void> closeOrder(String id) async {
    await FirebaseFirestore.instance.collection('order').doc(id).update({
      'isActive': false,
    });
  }
}
