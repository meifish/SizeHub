package src

import com.google.auth.oauth2.GoogleCredentials
import com.google.cloud.firestore.Firestore
import com.google.firebase.FirebaseApp
import com.google.firebase.FirebaseOptions
import com.google.firebase.cloud.FirestoreClient
import java.nio.file.Files
import java.nio.file.Path


fun main() {
    val options = FirebaseOptions.builder()
        .setCredentials(GoogleCredentials.fromStream(Files.newInputStream(Path.of("creds.json"))))
        .build()
    FirebaseApp.initializeApp(options)

    val db: Firestore = FirestoreClient.getFirestore()
    db.collection("test").listDocuments().forEach {
        println(it)
    }
}