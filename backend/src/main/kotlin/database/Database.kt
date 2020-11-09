package src.database

import com.google.auth.oauth2.GoogleCredentials
import com.google.cloud.firestore.Firestore
import com.google.firebase.FirebaseApp
import com.google.firebase.FirebaseOptions
import com.google.firebase.cloud.FirestoreClient
import com.google.gson.Gson
import kotlinx.serialization.decodeFromString
import kotlinx.serialization.json.Json
import src.data.ClothingItemData
import src.data.PostData
import src.data.UserMeasurementsData
import src.database.dbitems.ClothingItem
import src.database.dbitems.Post
import src.database.dbitems.toItem
import java.nio.file.Files
import java.nio.file.Path

class Database {

    private val sizeHubDb: SizeHubDb

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

        sizeHubDb = SizeHubDb(clothingItemDb, postDb)

        val gucciPurse = clothingItemDb.create(ClothingItemData("Gucci", "Purse"))?.toItem()
        val supremeSticker = clothingItemDb.create(ClothingItemData("Supreme", "Sticker"))?.toItem()
        val supremeTShirt = clothingItemDb.create(ClothingItemData("Supreme", "T-Shirt"))?.toItem()

        supremeTShirt?.let {
            val post = postDb.create(PostData(
                "null",
                supremeTShirt.id,
                UserMeasurementsData(weight = 120, height = 60),
                listOf(),
                "My new T-Shirt")
            )?.toItem(sizeHubDb)
        }
    }
}