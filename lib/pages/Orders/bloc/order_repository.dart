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
      'date': date,
      'userId': doc.uid,
      'tacos_pastor': 0,
    });
  }
}
