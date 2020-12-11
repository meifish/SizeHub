package src.api.responses

import kotlinx.serialization.Serializable
import kotlinx.serialization.encodeToString
import kotlinx.serialization.json.Json
import src.data.Id
import src.database.dbitems.Comment
import src.database.dbitems.User

@Serializable
class CommentResponse(val commentId: String,
                      val user: UserPublicResponse?,
                      val createdAt: String,
                      val comment: String,
                      val likes: Set<Id>,
                      val isLiked: Boolean) {

    companion object{
        fun from(comment: Comment, user: User?) = CommentResponse(
            comment.id,
            comment.getPublicUser()?.let { UserPublicResponse.from(it) },
            comment.data.createdAt,
            comment.data.comment,
            comment.data.likes,
            user?.let { comment.data.likes.contains(it.id) } ?: false)
    }

    fun toJson() = Json.encodeToString(this)
}