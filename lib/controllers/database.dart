import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});
  // collection reference
  final CollectionReference cheeseCollection =
      FirebaseFirestore.instance.collection("Cheese");

  Future<void> updateUserData(String sugars, String name, int strength) async {
    return await cheeseCollection.doc(uid).set({
      'sugars': sugars,
      'name': name,
      'strength': strength,
    });
  }
}
