import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class OrderRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> createUserOrderCollectionFirebase() async {
    var doc = _auth.currentUser!;
    var date = DateTime.now();

    await FirebaseFirestore.instance.collection('Orders').add({
      'startDate': date,
      'endDate': date,
      'userId': doc.uid,
      'isActive': true,
      'tacos_pastor': 2,
      'quesadillas_maiz': 3,
      'combinada_maiz': 5,
      'combinada_harina': 0,
      'lonche': 0,
      'lonche_queso': 0,
      'orden_carne': 5,
      'media_orden': 0,
      'refrescos': 2,
      'agua': 3,
    });
  }

  Future<List<Map<String, dynamic>>> getpastOder() async {
    List<Map<String, dynamic>> docToSend = [];
    final userCollection = await FirebaseFirestore.instance
        .collection("Orders")
        .where("userId", isEqualTo: _auth.currentUser!.uid)
        .where('isActive', isEqualTo: false)
        .get();
    var userOrder = userCollection.docs.map((element) => element.data());

    for (var element in userOrder) {
      Map<String, dynamic> temp = {};
      if (element['tacos_pastor'] > 0) {
        temp['tacos_pastor'] = element['tacos_pastor'];
      }
      if (element['quesadillas_maiz'] > 0) {
        temp['quesadillas_maiz'] = element['quesadillas_maiz'];
      }
      if (element['combinada_maiz'] > 0) {
        temp['combinada_maiz'] = element['combinada_maiz'];
      }
      if (element['combinada_harina'] > 0) {
        temp['combinada_harina'] = element['combinada_harina'];
      }
      if (element['lonche'] > 0) {
        temp['lonche'] = element['lonche'];
      }
      if (element['lonche_queso'] > 0) {
        temp['lonche_queso'] = element['lonche_queso'];
      }
      if (element['orden_carne'] > 0) {
        temp['orden_carne'] = element['orden_carne'];
      }
      if (element['media_orden'] > 0) {
        temp['media_orden'] = element['media_orden'];
      }
      if (element['refrescos'] > 0) {
        temp['refrescos'] = element['refrescos'];
      }
      if (element['agua'] > 0) {
        temp['agua'] = element['agua'];
      }
      if (temp.isNotEmpty) {
        docToSend.add(temp);
      }
    }

    return docToSend;
  }

  Future<List<Map<String, dynamic>>> getActualOder() async {
    List<Map<String, dynamic>> docToSend = [];
    final userCollection = await FirebaseFirestore.instance
        .collection("Orders")
        .where("userId", isEqualTo: _auth.currentUser!.uid)
        .where('isActive', isEqualTo: true)
        .get();
    var userOrder = userCollection.docs.map((element) => element.data());

    for (var element in userOrder) {
      Map<String, dynamic> temp = {};
      if (element['tacos_pastor'] > 0) {
        temp['tacos_pastor'] = element['tacos_pastor'];
      }
      if (element['quesadillas_maiz'] > 0) {
        temp['quesadillas_maiz'] = element['quesadillas_maiz'];
      }
      if (element['combinada_maiz'] > 0) {
        temp['combinada_maiz'] = element['combinada_maiz'];
      }
      if (element['combinada_harina'] > 0) {
        temp['combinada_harina'] = element['combinada_harina'];
      }
      if (element['lonche'] > 0) {
        temp['lonche'] = element['lonche'];
      }
      if (element['lonche_queso'] > 0) {
        temp['lonche_queso'] = element['lonche_queso'];
      }
      if (element['orden_carne'] > 0) {
        temp['orden_carne'] = element['orden_carne'];
      }
      if (element['media_orden'] > 0) {
        temp['media_orden'] = element['media_orden'];
      }
      if (element['refrescos'] > 0) {
        temp['refrescos'] = element['refrescos'];
      }
      if (element['agua'] > 0) {
        temp['agua'] = element['agua'];
      }
      if (temp.isNotEmpty) {
        docToSend.add(temp);
      }
    }

    return docToSend;
  }
}
