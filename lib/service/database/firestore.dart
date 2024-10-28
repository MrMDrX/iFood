import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final CollectionReference orders =
      FirebaseFirestore.instance.collection('orders');

  Future<void> saveOrderToDb(String receipt) async {
    await orders.add({
      'date': DateTime.now(),
      'receipt': receipt,
    });
  }
}
