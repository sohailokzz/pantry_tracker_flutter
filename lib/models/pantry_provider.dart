import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../services/firestore_services.dart';

class PantryProvider with ChangeNotifier {
  final FirestoreService _firestoreService = FirestoreService();

  Stream<QuerySnapshot> get pantries => _firestoreService.getPantries();

  Future<void> addPantry(Map<String, dynamic> data) async {
    await _firestoreService.addPantry(data);
    notifyListeners();
  }

  Future<void> updatePantry(String id, Map<String, dynamic> data) async {
    await _firestoreService.updatePantry(id, data);
    notifyListeners();
  }

  Future<void> deletePantry(String id) async {
    await _firestoreService.deletePantry(id);
    notifyListeners();
  }

  Future<void> increaseQuantity(String id, int currentQuantity) async {
    await _firestoreService.updatePantry(id, {'quantity': currentQuantity + 1});
    notifyListeners();
  }

  Future<void> decreaseQuantity(String id, int currentQuantity) async {
    if (currentQuantity > 0) {
      await _firestoreService
          .updatePantry(id, {'quantity': currentQuantity - 1});
      notifyListeners();
    }
  }
}
