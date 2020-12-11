package src.api.endpoints.comment

import kotlinx.serialization.Serializable
import kotlinx.serialization.decodeFromString
import src.api.endpoints.AuthEndpoint
import src.api.responses.CommentResponse
import src.api.responses.ErrorResponse
import src.data.Id
import src.database.PublicDb
import src.database.dbitems.User

@Serializable
class AddLikeArgs(val token: String, val commentId: Id)

class AddLikeEndpoint(publicDb: PublicDb): AuthEndpoint(publicDb) {

    override val path: String get() = "/addLike"

    override fun handle(jsonInput: String, user: User): String {
        val input = json.decodeFromString<AddLikeArgs>(jsonInput)

        val comment = publicDb.comments.getById(input.commentId)
            ?: return ErrorResponse.notFound("comment").toJson()

        val newComment = publicDb.addLike(input.token, comment.id)
            ?: return ErrorResponse("Something went wrong").toJson()

        return CommentResponse.from(newComment, user).toJson()
    }
}