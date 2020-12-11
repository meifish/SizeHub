package src.database.queries

import src.data.CommentData
import src.data.Id
import src.database.FirestoreCollection
import src.database.PublicDb
import src.database.dbitems.Comment
import src.database.dbitems.toItem

class CommentQueries(private val publicDb: PublicDb,
                     private val commentCollection: FirestoreCollection<CommentData>) {

    fun getById(id: Id): Comment? = commentCollection.getById(id)?.toItem(publicDb)

    fun getReplies(postId: Id): List<Comment>
            = commentCollection.getAll().filter { it.data.postId == postId }.map { it.toItem(publicDb) }
}