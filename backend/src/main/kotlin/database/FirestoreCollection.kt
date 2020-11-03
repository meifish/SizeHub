package src.database

import com.google.cloud.firestore.CollectionReference
import src.data.Id

class DataIdPair<T>(val id: Id, val data: T)

interface ReadOnlyFirestoreCollection<T>{

    fun getById(id: Id): T?
}

class FirestoreCollection<T>(private val collection: CollectionReference,
                             private val clazz: Class<T>)
    : ReadOnlyFirestoreCollection<T> {

    override fun getById(id: Id): T? {
        return collection.document(id).get().get().toObject(clazz)
    }

    fun create(item: T): DataIdPair<T>?{
        return collection.add(item).get().get().get().let {
            it.toObject(clazz)?.let { item -> DataIdPair(it.id, item) }
        }
    }
}