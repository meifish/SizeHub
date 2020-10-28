package src

import com.google.auth.oauth2.GoogleCredentials
import com.google.cloud.firestore.Firestore
import com.google.firebase.FirebaseApp
import com.google.firebase.FirebaseOptions
import com.google.firebase.cloud.FirestoreClient
import java.nio.file.Files
import java.nio.file.Path


fun main() {
    val serviceAccount = Files.newInputStream(Path.of("sizehub-ac5fc-firebase-adminsdk-i6sv1-0cf75a795b.json"))

    val options = FirebaseOptions.builder()
        .setCredentials(GoogleCredentials.fromStream(serviceAccount))
        .setDatabaseUrl("https://sizehub-ac5fc.firebaseio.com")
        .build()

    FirebaseApp.initializeApp(options)
    val db: Firestore = FirestoreClient.getFirestore()
    val a =db.collection("test2").document("test")
    println(a)



}