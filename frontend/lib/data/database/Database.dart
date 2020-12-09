import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Database {
  Future<String> getUsername(String userId) async {
    await Firebase.initializeApp();
    DocumentSnapshot doc = await FirebaseFirestore.instance
        .collection("Users")
        .document(userId)
        .get();
    if (doc == null) return "";
    return doc["username"];
  }

  Future<Stream<QuerySnapshot>> readAllNew() async {
    await Firebase.initializeApp();
    return FirebaseFirestore.instance.collection("Posts").snapshots();
  }

  Future<String> uploadFile(file) async {
    print(file.toString());
    String firebaseFileName = 'images/b.png';
    try {
      return FirebaseStorage.instance.ref(firebaseFileName).putFile(file).then(
          (_) => FirebaseStorage.instance
              .ref(firebaseFileName)
              .getDownloadURL()
              .then((value) => value));
    } on FirebaseException catch (e) {
      return e.toString();
    }
  }
}
