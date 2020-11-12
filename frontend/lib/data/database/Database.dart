
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:size_hub/data/PostData.dart';

class Database{

  Future<String> getUsername(String userId) async {
    await Firebase.initializeApp();
    DocumentSnapshot doc = await FirebaseFirestore.instance.collection("Users").document(userId).get();
    if(doc == null) return "";
    return doc["username"];
  }

  Future<List<PostData>> readAll() async {
    await Firebase.initializeApp();
    List<PostData> posts = [];
    for(QueryDocumentSnapshot e in (await FirebaseFirestore.instance.collection("Posts").get()).docs){
      posts.add(PostData(
          e.id,
          getUsername(e["userId"]),
          (e["photoUrls"] as List<dynamic>).map((e) => e as String).toList()
      ));
    }
    return posts;
  }
}