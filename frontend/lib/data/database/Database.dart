
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class Database{

  Future<String> getUsername(String userId) async {
    await Firebase.initializeApp();
    DocumentSnapshot doc = await FirebaseFirestore.instance.collection("Users").document(userId).get();
    if(doc == null) return "";
    return doc["username"];
  }

  Future<Stream<QuerySnapshot>> readAllNew() async {
    await Firebase.initializeApp();
    return FirebaseFirestore.instance.collection("Posts").snapshots();
  }
}