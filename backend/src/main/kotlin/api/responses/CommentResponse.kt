package src.api.responses

import kotlinx.serialization.Serializable
import src.database.dbitems.Comment

@Serializable
class CommentResponse(val commentId: String,
                      val comment: String) : Response {

    companion object{
        fun from(comment: Comment) = CommentResponse(comment.id, comment.data.comment)
    }
}