import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});
  // collection reference
  final CollectionReference cheeseCollection =
      FirebaseFirestore.instance.collection("Favorite");

  Future<void> updateUserData(String name, String useruid) async {
    return await cheeseCollection.doc(uid).set({
      'name': name,
      'uid': useruid,
      'fav': {},
    });
  }
}
