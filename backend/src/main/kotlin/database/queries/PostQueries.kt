package src.database.queries

import com.google.cloud.firestore.Query
import src.data.Id
import src.data.PostData
import src.database.FirestoreCollection
import src.database.PublicDb
import src.database.dbitems.Post
import src.database.dbitems.toItem

class PostQueries(private val publicDb: PublicDb,
                  private val postCollection: FirestoreCollection<PostData>) {

    //TODO: ADD PERMISSIONS / PRIAVY SETTINGS
    fun getById(id: Id): Post? = postCollection.getById(id)?.toItem(publicDb)

    fun getByUser(userId: Id): List<Post>
        = postCollection.getAllBy("userId", userId).map { it.toItem(publicDb) }

    fun getLatestPosts(amount: Int): List<Post>
        = postCollection.sortByAndTake("createdAt", Query.Direction.DESCENDING, amount).map { it.toItem(publicDb) }
}