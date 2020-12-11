package src.database.mutators

import src.data.CommentData
import src.data.Id
import src.database.FirestoreCollection
import src.database.PublicDb
import src.database.dbitems.Comment
import src.database.dbitems.toItem

class AddLikeMutator(private val commentCollection: FirestoreCollection<CommentData>,
                     private val publicDb: PublicDb) {

    operator fun invoke(token: String, commentId: Id): Comment? {
        val user = publicDb.auth.getUser(token) ?: return null
        val comment = commentCollection.getById(commentId) ?: return null
        commentCollection.collection.document(commentId)
            .update("likes", comment.data.likes + user.id)
        return commentCollection.getById(commentId)?.toItem(publicDb)
    }
}