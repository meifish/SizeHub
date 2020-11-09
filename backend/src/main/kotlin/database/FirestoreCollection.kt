package src.database

import com.google.cloud.firestore.CollectionReference
import com.google.cloud.firestore.DocumentSnapshot
import com.google.gson.Gson
import kotlinx.serialization.decodeFromString
import kotlinx.serialization.json.Json
import src.data.Id

class DataIdPair<T>(val id: Id, val data: T)

interface ReadOnlyFirestoreCollection<T>{

    fun getById(id: Id): T?
}

class FirestoreCollection<T>(private val collection: CollectionReference,
                             private val decoder: (String)->T)
    : ReadOnlyFirestoreCollection<T> {

    private val gson = Gson()

    private fun toObject(documentSnapshot: DocumentSnapshot): T{
        return decoder(gson.toJson(documentSnapshot.data))
    }

    override fun getById(id: Id): T? {
        return toObject(collection.document(id).get().get())
    }

    fun create(item: T): DataIdPair<T>?{
        return collection.add(item).get().get().get().let {
            toObject(it)?.let { item -> DataIdPair(it.id, item) }
        }
    }
}