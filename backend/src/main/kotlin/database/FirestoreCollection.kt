package src.database

import com.google.cloud.firestore.CollectionReference
import com.google.cloud.firestore.DocumentSnapshot
import com.google.gson.Gson
import kotlinx.serialization.decodeFromString
import kotlinx.serialization.json.Json
import src.data.Id

class DataIdPair<T>(val id: Id, val data: T)

class FirestoreCollection<T>(private val collection: CollectionReference,
                             private val decoder: (String)->T){

    private val gson = Gson()

    fun <U> migrate(oldDecoder: (String)->U, updater: (U)->T){
        collection.listDocuments().forEach {
            it.set(updater(oldDecoder(gson.toJson(it.get().get().data))) as Any)
        }
    }

    private fun toObject(documentSnapshot: DocumentSnapshot): DataIdPair<T>?{
        if(documentSnapshot.data == null) return null
        try {
            return DataIdPair(documentSnapshot.id, decoder(gson.toJson(documentSnapshot.data)))
        }
        catch (e: Exception){
            System.err.println("Critical Error decoding ${documentSnapshot.data}")
            System.err.println("ID = ${documentSnapshot.id}")
            throw e
        }
    }

    fun getById(id: Id): DataIdPair<T>? {
        return toObject(collection.document(id).get().get())
    }

    fun getBy(field: String, value: Any): DataIdPair<T>? {
        return collection.whereEqualTo(field, value).get().get().firstOrNull()?.let { toObject(it) }
    }

    fun getAllBy(field: String, value: Any): List<DataIdPair<T>> {
        return collection.whereEqualTo(field, value).get().get().mapNotNull { toObject(it) }
    }

    fun getAll(): List<DataIdPair<T>>
            = collection.listDocuments().mapNotNull { it.get().get()?.let { doc -> toObject(doc) } }

    fun create(item: T): DataIdPair<T>? {
        return toObject(collection.add(item).get().get().get())
    }
}