package src.database

import com.google.auth.oauth2.GoogleCredentials
import com.google.cloud.firestore.Firestore
import com.google.firebase.FirebaseApp
import com.google.firebase.FirebaseOptions
import com.google.firebase.cloud.FirestoreClient
import kotlinx.serialization.decodeFromString
import kotlinx.serialization.json.Json
import src.auth.AdminBackdoorAuthService
import src.auth.FirebaseAuthService
import src.auth.MultiAuthService
import src.data.*
import java.nio.file.Files
import java.nio.file.Path

class Database {

    val publicDb: PublicDb

    init{
        val serviceAccount = Files.newInputStream(
            Path.of("sizehub-ac5fc-firebase-adminsdk-i6sv1-0cf75a795b.json"))

        val options = FirebaseOptions.builder()
            .setCredentials(GoogleCredentials.fromStream(serviceAccount))
            .setDatabaseUrl("https://sizehub-ac5fc.firebaseio.com")
            .build()

        FirebaseApp.initializeApp(options)
        val db: Firestore = FirestoreClient.getFirestore()

        val clothingItemDb = FirestoreCollection(db.collection("ClothingItems")){ Json.decodeFromString<ClothingItemData>(it) }
        val postDb = FirestoreCollection(db.collection("Posts")){ Json.decodeFromString<PostData>(it) }
        val brandDb = FirestoreCollection(db.collection("Brands")){ Json.decodeFromString<BrandData>(it) }
        val userDb = FirestoreCollection(db.collection("Users")){ Json.decodeFromString<UserData>(it) }
        val commentDb = FirestoreCollection(db.collection("Comments")){ Json.decodeFromString<CommentData>(it) }

        val authService = MultiAuthService(listOf(AdminBackdoorAuthService(), FirebaseAuthService()))

        publicDb = PublicDb(clothingItemDb, postDb, brandDb, userDb, commentDb, authService)

        //LuluLemonDatasetUploaderV2(userDb, publicDb).upload()
    }
}