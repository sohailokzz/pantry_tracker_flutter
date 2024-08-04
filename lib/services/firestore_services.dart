import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final CollectionReference _collection =
      FirebaseFirestore.instance.collection('pantry');

  Future<void> addPantry(Map<String, dynamic> data) {
    return _collection.add(data);
  }

  Future<void> updatePantry(String id, Map<String, dynamic> data) {
    return _collection.doc(id).update(data);
  }

  Future<void> deletePantry(String id) {
    return _collection.doc(id).delete();
  }

  Stream<QuerySnapshot> getPantries() {
    return _collection.snapshots();
  }
}
