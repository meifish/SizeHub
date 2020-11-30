package src.database.mutators

import src.data.CommentData
import src.database.FirestoreCollection
import src.database.PublicDb
import src.database.dbitems.Comment
import src.database.dbitems.toItem

class CreateCommentMutator(private val commentCollection: FirestoreCollection<CommentData>,
                           private val publicDb: PublicDb) {

    //TODO: token check
    operator fun invoke(commentData: CommentData): Comment? {
        publicDb.getPostById(commentData.postId) ?: return null
        return commentCollection.create(commentData)?.toItem(publicDb)
    }
}