package src.database.dbitems

import src.data.CommentData
import src.data.Id
import src.database.DataIdPair
import src.database.PublicDb

class Comment(override val id: Id,
              override val data: CommentData,
              private val publicDb: PublicDb) : DbItem<CommentData> {

    fun getPost(): Post? = data.postId.let { publicDb.posts.getById(it) }
}

fun DataIdPair<CommentData>.toItem(publicDb: PublicDb) = Comment(id, data, publicDb)