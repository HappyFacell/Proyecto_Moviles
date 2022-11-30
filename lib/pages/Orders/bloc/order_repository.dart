import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:project/pages/Auth/auth_repository.dart';

class OrderRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> createUserOrderCollectionFirebase() async {
    var doc = _auth.currentUser!;
    print('perro doc: $doc');
    var date = DateTime.now();

    await FirebaseFirestore.instance.collection('Orders').add({
      'startDate': date,
      'endDate': date,
      'userId': doc.uid,
      'isActive': true,
      'tacos_pastor': 0,
      'quesadillas_maiz': 0,
      'combinada_maiz': 0,
      'combinada_harina': 0,
      'lonche': 0,
      'lonche_queso': 0,
      'orden_carne': 0,
      'media_orden': 0,
      'refrescos': 0,
      'agua': 0,
    });
  }

  Future<Iterable<Map<String, dynamic>>> getOder() async {
    final userCollection = await FirebaseFirestore.instance
        .collection("Orders")
        .where("userId", isEqualTo: _auth.currentUser!.uid)
        .get();
    var userOrder = userCollection.docs.map((element) => element.data());

    // userOrder.forEach(
    //   (element) {
    //     if (element['tacos_pastor'] > 0) {
    //       print('Si hay orden de pastor');
    //     }
    //     print('Elemento: $element\n');
    //   },
    // );
    // print(
    //     'userOrder Length: ${userOrder.length}\nUserOrder contains: $userOrder ');

    return userOrder;
  }
}
