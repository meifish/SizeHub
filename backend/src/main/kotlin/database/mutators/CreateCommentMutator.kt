package src.database.mutators

import src.data.CommentData
import src.data.Id
import src.database.FirestoreCollection
import src.database.ProtectedDb
import src.database.dbitems.Comment
import src.database.dbitems.toItem

class CreateCommentArgs(val postId: Id,
                        val comment: String){

    fun toCommentData(userId: String, createdAt: String)
    = CommentData(userId, postId, comment, createdAt)
}

class CreateCommentMutator(private val commentCollection: FirestoreCollection<CommentData>,
                           private val protectedDb: ProtectedDb) {

    //TODO: token check
    operator fun invoke(token: String, createCommentArgs: CreateCommentArgs): Comment? {
        val user = protectedDb.getUser(token) ?: return null
        protectedDb.getPostById(createCommentArgs.postId) ?: return null
        val commentData = createCommentArgs.toCommentData(user.id, System.currentTimeMillis().toString())
        return commentCollection.create(commentData)?.toItem(protectedDb)
    }
}