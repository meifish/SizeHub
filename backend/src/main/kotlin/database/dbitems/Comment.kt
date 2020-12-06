package src.database.dbitems

import src.data.CommentData
import src.data.Id
import src.database.DataIdPair
import src.database.ProtectedDb

class Comment(override val id: Id,
              override val data: CommentData,
              private val protectedDb: ProtectedDb) : DbItem<CommentData> {

    fun getPost(): Post? = data.postId.let { protectedDb.getPostById(it) }
}

fun DataIdPair<CommentData>.toItem(protectedDb: ProtectedDb) = Comment(id, data, protectedDb)